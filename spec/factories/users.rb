FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              {'1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '花' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'ハナ' }
    birthday              { '1990-01-01' }
  end
end
