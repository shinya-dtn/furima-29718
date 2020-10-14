FactoryBot.define do
  factory :purchase do
    token           { 'tok_abcdefghijk00000000000000000' }
    zip_code        { '111-1111' }
    area_id         { '1' }
    city            { '横浜市' }
    street_number   { '1-1' }
    phone_number    { '00000000000' }
  end
end
