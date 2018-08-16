require 'rails_helper'

describe 'meal foods API' do
  let(:meal) { create(:meal) }
  let(:message) { "Successfully removed #{food.name} from #{meal.name}" }

  context 'deletes a meal food' do
    it 'with correct params' do
      create_list(:food, 4, meals: [meal])
      food = meal.foods.create(name: 'apple', calories: 20)

      expect(meal.foods.length).to eq(5)

      delete "/api/v1/meals/#{meal.id}/foods/#{food.id}"

      expect(meal.foods.length).to eq(4)
      expect(response.status).to eq(200)
      expect(json_response[:message]).to eq(message)
    end
  end
end
