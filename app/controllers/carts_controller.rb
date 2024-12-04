class CartsController < ApplicationController
    before_action :authenticate_user!

    def show
        @cart_items = current_order.cart_items
    end
end
