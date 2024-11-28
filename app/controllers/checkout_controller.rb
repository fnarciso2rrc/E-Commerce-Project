class CheckoutController < ApplicationController

    def create

        @cart = current_user.cart

        if @cart.cart_items.empty?
            flash[:alert] = "Your cart is empty."

            redirect_to root_path
            return
        end

        tax_rate = calculate_tax_rate

        order = Order.create!(
            user_id: current_user.id,
            status: "pending",
            total_amount: calculate_total(@cart, tax_rate),
            subtotal_amount: calculate_subtotal(@cart),
            tax_amount: calculate_tax_amount(@cart, tax_rate),
            stripe_payment_id: nil
        )

        line_items = @cart.cart_items.map do |cart_item|
            {
                    price_data: {
                        currency: "cad",
                        product_data: {
                            name: cart_item.product.product_name,
                            description: "Category: #{cart_item.product.category.category_type}",
                        },
                        unit_amount: (cart_item.product.price * 100 * (tax_rate + 1)).to_i,
                    },
                    quantity: cart_item.quantity
            }
        end

        # total = @cart.subtotal * (1 + tax_rate)
        
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ["card"],
            success_url: checkout_success_url(order_id: order.id) + "&session_id={CHECKOUT_SESSION_ID}",
            cancel_url: checkout_cancel_url,
            mode: "payment",
            line_items: line_items,
            #amount: (total * 100).to_i,
        )

        redirect_to @session.url, allow_other_host: true
    end

    def shipping_information
        @shipping_address = {
            street_address: current_user.street_address || "",
            city: current_user.city || "",
            province: current_user.province_id || nil,
            postal_code: current_user.postal_code || "",
        }

        @provinces = Province.all
    end


    def success
        order = Order.find(params[:order_id])

        if params[:session_id].present?
            order.update!(
              status: "paid",
              stripe_payment_id: params[:session_id]
            )
          else
            flash[:alert] = "Payment was successful, but session ID is missing."
          end

        flash[:notice] = "Payment was successful. Thank you for your oder!"
        redirect_to root_path
    end

    def cancel
    end

    private

    def calculate_tax_rate
        # Get users province
        if current_user.province.present?
            province = Province.find(current_user.province_id)
            tax_rate = province.tax
        else
            form_province = params[:province]
            province = Province.find(form_province)
            tax_rate = province.tax
        end

        tax_rate
    end

    def calculate_subtotal(cart)
        cart.cart_items.sum { |item| item.product.price * item.quantity }
    end

    def calculate_tax_amount(cart, tax_rate)
        calculate_subtotal(cart) * tax_rate
    end

    def calculate_total(cart, tax_rate)
        calculate_subtotal(cart) + calculate_tax_amount(cart, tax_rate)
    end
end
