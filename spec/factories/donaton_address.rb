FactoryBot.define do
  factory :donation_address do
    post_number    {"000-0000"}
    area_id        {Faker::Number.between(from: 2, to: 48)}
    municipalities {"札幌市"}
    house_number   {"青山1-1-1"}
    building_name  {"柳ビル"}
    phone_number   {"12345678901"}
  end
end
