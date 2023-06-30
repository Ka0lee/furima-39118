FactoryBot.define do
  factory :item do
    name {"てすと"}
    price {"1000"}
    info {Faker::Lorem.sentence}
    category_id {2}
    sales_status_id {2}
    shipping_fee_status_id {2}
    prefecture_id {2}
    scheduled_delivery_id {2}

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/inu.jpg'), filename: 'inu.jpg')
    end


  end
end
