FactoryBot.define do
  factory :food do
    sequence(:name)     { Faker::FamilyGuy.character }
    sequence(:calories) { rand(1000) }
  end
end
