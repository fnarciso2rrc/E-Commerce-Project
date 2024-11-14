class Product < ApplicationRecord
    has_many :product_categories
    has_many :categories, through: :product_categories

    validates :product_name, :brand, :price, :ingredients, presence: true
    validates :price, numericality: {greater_than: 0}

    def self.ransackable_attributes(auth_object = nil)
        ["brand", "created_at", "id", "ingredients", "price", "product_name", "ranking", "updated_at"]
    end
end
