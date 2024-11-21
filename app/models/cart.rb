class Cart < ApplicationRecord
    has_many :cart_items

    def subtotal
        cart_items.collect {|cart_item| cart_item.valid? (cart_item.unit_price*cart_item.quantity) : 0}.sum
    end

    private

    def set_subtotal
        self[:subtotal] = subtotal
    end

end
