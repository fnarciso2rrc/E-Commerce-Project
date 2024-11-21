class CartItemsController < ApplicationController

    def create
        @cart = current_order
        @cart_item = @cart.cart_items.new(cart_item_params)
        @cart.save
        session[:cart_id] = @cart.id
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:product_id, :quantity)
    end
end
