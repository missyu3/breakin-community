FactoryBot.define do
  factory :place do
    name { Faker::Address.city }
    address { Faker::Address.street_address }
    price { Faker::Lorem.sentence }
    remark { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
  end
end
