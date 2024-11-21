class Product < ApplicationRecord
  validates :name, presence: true
  has_many :order_items
end
