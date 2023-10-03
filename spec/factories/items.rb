FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    price {1000}
    category_id {2}
    item_condition_id {2}
    shipping_fee_id {2}
    prefecture_id {2}
    shipping_date_id {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
