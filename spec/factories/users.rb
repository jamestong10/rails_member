FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    factory :admin do
      after(:create) {|user| user.grant(:admin)}
    end
  end
end