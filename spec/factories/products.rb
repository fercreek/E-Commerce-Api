FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price(range: 10..100) }
    stock { Faker::Number.between(from: 1, to: 50) }
  end
end
