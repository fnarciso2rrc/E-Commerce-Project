class OrdersController < ApplicationController
    before_action :authenticate_user!

    def index
        @orders = current_user.orders.includes(order_items: :product)
    end

    def show
        @order = Order.find(params[:id])

        if @order
            @order_items = @order.order_items.includes(:product)
        else
            flash[:alert] = "Order not found."
            redirect_to orders_path
        end 
        # @orders = current_user.orders
    end
end
