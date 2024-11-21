class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items

  validates :status, presence: true

  before_save :calculate_total_price

  private

  def calculate_total_price
    self.total_price = order_items.sum { |item| item.quantity * item.price }
  end
end
