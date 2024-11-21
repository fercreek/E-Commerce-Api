FactoryBot.define do
  factory :order do
    user
    status { 'pending' }
    total_price { 0 }
  end
end
