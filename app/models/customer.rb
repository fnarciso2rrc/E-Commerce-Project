class Customer < ApplicationRecord
    belongs_to :province

    validates :street_address, :city, :postal_code, :email, presence: true
    validates :postal_code, format: { with: /\A[A-Za-z]\d[A-Za-z][ -]?\d[A-Za-z]\d\z/, message: "must be a valid postal code" }
end
