FactoryBot.define do
  factory :item do
    item_name               {Faker::Name.initials(number: 2)}
    item_info               {Faker::Lorem.sentence}
    category_id             {Faker::Number.between(from: 2, to: 10)}
    sales_status_id         {Faker::Number.between(from: 2, to: 7)}
    shipping_fee_status_id  {Faker::Number.between(from: 2, to: 3)}
    prefecture_id           {Faker::Number.between(from: 2, to: 11)}
    scheduled_delivery_id   {Faker::Number.between(from: 2, to: 48)}
    item_price              {Faker::Number.between(from: 300, to: 9999999)}
    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
