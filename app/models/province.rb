class Province < ApplicationRecord
    has_many :customers

    validates :province_name, presence: true, uniqueness: true
    validates :alpha_code, presence: true, length: { is: 2 }, uniqueness: true
end
