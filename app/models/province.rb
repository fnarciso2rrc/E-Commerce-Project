class Province < ApplicationRecord
    has_many :users

    validates :province_name, presence: true, uniqueness: true
    validates :alpha_code, presence: true, length: { is: 2 }, uniqueness: true

    def self.ransackable_associations(auth_object = nil)
        ["users"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["alpha_code", "created_at", "id", "id_value", "province_name", "tax", "updated_at"]
    end
end
