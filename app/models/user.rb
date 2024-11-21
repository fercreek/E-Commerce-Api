class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :orders, dependent: :destroy
  has_many :purchased_products, through: :orders, source: :order_items
end
