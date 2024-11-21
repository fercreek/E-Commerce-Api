class Product < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true

  has_many :order_items

  def self.recommend_for(user)
    purchased_categories = user.purchased_products
                               .includes(:product)
                               .pluck('products.category')
                               .uniq

    joins(:order_items)
      .where(category: purchased_categories)
      .where.not(id: user.purchased_products.pluck(:product_id))
      .group(:id)
      .order('COUNT(order_items.id) DESC')
      .limit(5)
  end
end
