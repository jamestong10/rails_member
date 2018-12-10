FactoryBot.define do
  factory :product do
    name {Faker::Name.name}
    quantity {Faker::Number.number(4)}
    price {Faker::Number.number(4)}
  end
end