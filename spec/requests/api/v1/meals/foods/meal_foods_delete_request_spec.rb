require 'rails_helper'

describe 'meal foods API' do
  let(:meal) { create(:meal_with_foods) }
  let(:food) { meal.foods.first }
  let(:message) { "Successfully removed #{food.name} from #{meal.name}" }

  context 'deletes a meal food' do
    it 'with correct params' do
      expect(meal.foods.length).to eq(5)

      delete "/api/v1/meals/#{meal.id}/foods/#{meal.foods.first.id}"

      expect(meal.foods.length).to eq(4)
      expect(response.status).to eq(200)
      expect(json_response[:message]).to eq(message)
    end
  end
end
