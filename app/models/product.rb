class Product < ApplicationRecord
    has_many :product_categories
    has_many :categories, through: :product_categories

    validates :product_name, :brand, :price, :ingredients, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }

    def self.ransackable_associations(auth_object = nil)
        ["categories", "product_categories"]
    end

    def self.ransackable_attributes(auth_object = nil)
    ["brand", "created_at", "id", "id_value", "ingredients", "price", "product_name", "ranking", "updated_at"]
    end
end
