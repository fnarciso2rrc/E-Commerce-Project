class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :province, optional: true
  has_one :cart
  has_many :orders

  def self.ransackable_attributes(auth_object = nil)
    ["city", "created_at", "email", "encrypted_password", "id", "id_value", "postal_code", "province_id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "street_address", "updated_at"]
  end
end
