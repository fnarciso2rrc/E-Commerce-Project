module ApplicationHelper

    def current_order
        # if !session[:cart_id].nil?
        #     Cart.find(session[:cart_id])
        # else
        #     Cart.new
        # end
        # if session[:cart_id].present?
        #     Cart.find(session[:cart_id]) # Find the cart by session ID

        #     if cart.user != current_user
        #         cart = Cart.create(user: current_user)
        #         session[:cart_id] = cart.id
        #     end
        #     cart
        # else
        #     cart = Cart.find_by(user: current_user) # Create a new cart and save it

        #     # Creates a new cart if no existing cart exists
        #     unless cart
        #         cart = Cart.create(user: current_user)
        #     end
            
        #     session[:cart_id] = cart.id # Store the new cart's ID in the session
        #     cart
        # end


        if current_user
            cart = current_user.cart || Cart.create(user_id: current_user.id)
        else
            cart = Cart.find_by(id: session[:cart_id], user_id: nil)
        end 

        # session[:cart_id] = cart.id if cart.persisted?

        if cart && cart.persisted?
            session[:cart_id] = cart.id
          end

        cart
    end


end
