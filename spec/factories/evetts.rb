FactoryBot.define do
  factory :evett do
    name          { Faker::Name.name }
    text          { Faker::Lorem.sentence }
    price         { Faker::Number.between(from: 299, to: 10_000_000) }
    limit_date    { Faker::Date.in_date_period(year: 2022, month: 1) }
    share_area_id { Faker::Number.between(from: 1, to: 3) }
    association :user
  end
end
