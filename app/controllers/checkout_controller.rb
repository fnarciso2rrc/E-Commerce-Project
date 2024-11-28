class CheckoutController < ApplicationController

    def create

        @cart = current_user.cart

        if @cart.cart_items.empty?
            flash[:alert] = "Your cart is empty."

            redirect_to root_path
            return
        end

        tax_rate = calculate_tax_rate

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
            success_url: checkout_success_url,
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
end
