class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :foods

  has_many :foods
end
