FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.initials(number: 2) }
    email                  { Faker::Internet.free_email }
    password               { 'a00000' }
    password_confirmation  { password }
    first_name             { '山田' }
    last_name              { '太朗' }
    first_name_k           { 'ヤマダ' }
    last_name_k            { 'タロウ' }
    birthday               { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
