class Product < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
        ["brand", "created_at", "id", "ingredients", "price", "product_name", "ranking", "updated_at"]
    end
end
