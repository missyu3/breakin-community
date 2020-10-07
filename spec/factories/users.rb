FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = "#{Faker::Internet.password(min_length: 4)}a1"  #半角英数字を含む6文字以上の文字列
    password { password }
    password_confirmation { password }
    remark { Faker::Lorem.sentence }
    dance_level_id { 3 }
  end
end
