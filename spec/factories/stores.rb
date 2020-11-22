FactoryBot.define do
  factory :store do
    name { Faker::Name.name + " Store" }
  end
end
