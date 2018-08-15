FactoryBot.define do
  factory :meal do
    sequence(:name) { %w[breakfast lunch dinner snack].sample }
  end
end
