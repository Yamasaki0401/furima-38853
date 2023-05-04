FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '花' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'ハナ' }
    birthday              { '1990-01-01' }
  end
end
