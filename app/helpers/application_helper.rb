module ApplicationHelper

    def current_order
        # if !session[:cart_id].nil?
        #     Cart.find(session[:cart_id])
        # else
        #     Cart.new
        # end
        if session[:cart_id].present?
            Cart.find(session[:cart_id]) # Find the cart by session ID
        else
            cart = Cart.create # Create a new cart and save it
            session[:cart_id] = cart.id # Store the new cart's ID in the session
            cart
        end
    end
end
