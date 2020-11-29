FactoryBot.define do
  factory :food do
    name { 'じゃがいも' }
    number { Faker::Number.between(from: 1, to: 10_000) }
    unit_id { Faker::Number.between(from: 2, to: 9) }
    bb_date { Date.today }
    category_id { Faker::Number.between(from: 2, to: 14) }

    association :user
  end
end
