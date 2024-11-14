class Category < ApplicationRecord
    has_many :product_categories
    has_many :products, through: :product_categories

    validates :category_type, presence: true
    validates :category_type, uniqueness: true
end
