FactoryBot.define do
  factory :meal do
    sequence(:name) { %w[breakfast lunch dinner snack].sample }

    factory :meal_with_foods do
      transient do
        food_count 5
      end
      after(:create) do |meal, evaluator|
        create_list(:food,
                    evaluator.food_count,
                    meal: meal)
      end
    end
  end
end
