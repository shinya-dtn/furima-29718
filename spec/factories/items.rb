FactoryBot.define do
  factory :item do
    prodact_name   { '商品' }
    comment        { 'イメージ' }
    category_id    { '1' }
    status_id      { '1' }
    burden_id      { '1' }
    area_id        { '1' }
    day_id         { '1' }
    money          { '300' }
    association :user
  end
end
