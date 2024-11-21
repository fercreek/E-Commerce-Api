FactoryBot.define do
  factory :order_item do
    order
    product
    quantity { Faker::Number.between(from: 1, to: 10) }
    price { Faker::Commerce.price(range: 10..100) }
  end
end
