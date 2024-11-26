class CheckoutController < ApplicationController

    def create

        @cart = current_user.cart

        if @cart.cart_items.empty?
            flash[:alert] = "Your cart is empty."

            redirect_to root_path
            return
        end

        line_items = @cart.cart_items.map do |cart_item|
            {
                    price_data: {
                        currency: "cad",
                        product_data: {
                            name: cart_item.product.product_name,
                            category: cart_item.product.category.category_type,
                        },
                        unit_amount: cart_item.product.price,
                    },
                    quantity: cart_item.quantity
            }


        total_price = @cart.cart_items.sum { |item| item.product.price * item.quantity }
        
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ["card"],
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url,
            mode: "payment",
            line_items: line_items,
            total_amount: total_price
        )

        redirect_to @session.url, allow_other_host: true


    def success

        # @session = Stripe::Checkout::Session.create(
        #     payment_method_types: ["card"],
        #     success_url: checkout_success_url,
        #     cancel_url: checkout_cancel_url,
        #     mode: "payment",
        #     line_items: [
        #             price_data: {
        #                 currency: "cad",
        #                 product_data: {
        #                     name: product.name,
        #                     description: product.description,
        #                 },
        #                 unit_amount: product.price_cents,
        #             },
        #             quantity: 1
        #     ]
        # )
        # redirect_to @session.url, allow_other_host: true
    end

    def cancel
    end
end
