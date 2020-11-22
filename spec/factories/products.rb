FactoryBot.define do
  factory :product do
    name { Faker::Food.fruits }
    store_id { 1 }
  end
end
