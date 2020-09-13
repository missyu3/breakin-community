FactoryBot.define do
  factory :place do
    name              {Faker::Address.city}
    address           {Faker::Address.street_address}
    price             {Faker::Number.number(digits: 10)}
  end
end
