# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Create Products"

10.times.each do |n|
  Product.create(name: Faker::Name.name, quantity: rand(100..1000), price: rand(100.1000))
end

puts "Create Users"

u1 = User.new(email: 'admin@example.com', password: '12341234')
u1.add_role(:admin)
u1.save!

u2 = User.create(email: 'user1@example.com', password: '12341234')
u2.add_role(:premium)
u2.save!

User.create(email: 'user2@example.com', password: '12341234')


