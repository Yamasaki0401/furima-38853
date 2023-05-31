FactoryBot.define do
  factory :item do
    item_name            { 'タオル' }
    description          { 'フェイスタオルです' }
    condition_id         { 2 }
    category_id          { 2 }
    shipping_fee_id      { 2 }
    shipping_schedule_id { 2 }
    prefecture_id        { 2 }
    price                { 3000 }

    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
