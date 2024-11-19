class Category < ApplicationRecord
    has_many :products

    validates :category_type, presence: true
    validates :category_type, uniqueness: true

    def self.ransackable_associations(auth_object = nil)
        ["product_categories", "products"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["category_description", "category_type", "created_at", "id", "id_value", "updated_at"]
    end
end
