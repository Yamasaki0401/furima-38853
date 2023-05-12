FactoryBot.define do
  factory :order_form do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { 'マカロンハウス' }
    phone_number { '09011112222' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
