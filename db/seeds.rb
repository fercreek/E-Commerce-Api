require 'faker'

OrderItem.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all

puts 'Creando usuario...'
user = User.create!(
  name: 'John Doe',
  email: 'johndoe@example.com',
  password: 'password123',
  password_confirmation: 'password123'
)
puts "Usuario creado: #{user.email} / Contraseña: password123"

categories = ['Electronics', 'Books', 'Clothing', 'Toys', 'Home']

puts 'Creando productos...'
50.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence(word_count: 15),
    price: Faker::Commerce.price(range: 10..500),
    stock: Faker::Number.between(from: 1, to: 100),
    category: categories.sample
  )
end

puts "Productos creados: #{Product.count}"

puts 'Creando una orden inicial para el usuario...'
order = Order.create!(
  user: user,
  status: 'pending',
  total_price: 0
)

5.times do
  product = Product.all.sample
  quantity = Faker::Number.between(from: 1, to: 5)

  order.order_items.create!(
    product: product,
    quantity: quantity,
    price: product.price
  )
end

order.update!(total_price: order.order_items.sum { |item| item.quantity * item.price })

puts 'Orden inicial creada.'
puts "Total de la orden: $#{order.total_price.round(2)}"
puts 'Seed completado exitosamente.'
