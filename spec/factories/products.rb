FactoryBot.define do
  factory :product do
    title        {Faker::Lorem.sentence}
    text         {Faker::Lorem.sentence}
    price        {Faker::Number.between(from: 300, to: 9999999)}
    status_id    {Faker::Number.between(from: 2, to: 6)}
    category_id  {Faker::Number.between(from: 2, to: 11)}
    burden_id    {Faker::Number.between(from: 2, to: 3)}
    area_id      {Faker::Number.between(from: 2, to: 48)}
    guideline_id {Faker::Number.between(from: 2, to: 4)}
    association :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
