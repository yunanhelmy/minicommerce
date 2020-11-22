FactoryBot.define do
  factory :product_variant do
    name { Faker::Color.color_name }
  end
end
