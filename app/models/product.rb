class Product < ApplicationRecord
    belongs_to :category

    validates :product_name, :brand, :price, :ingredients, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }

    def self.search(keywords, category_id)
        products = all

        if keywords.present?
            products = products.where("product_name LIKE ?", "%#{keywords}%")
        end

        if category_id.present?
            products = products.where(category_id: category_id)
        end

        products
    end 

    def self.ransackable_associations(auth_object = nil)
        ["category"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["brand", "category_id", "created_at", "id", "ingredients", "price", "product_name", "ranking", "updated_at"]
    end
end
