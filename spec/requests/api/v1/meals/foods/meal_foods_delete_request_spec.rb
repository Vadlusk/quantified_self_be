require 'rails_helper'

describe 'meal foods API' do
  let(:meal) { create(:meal) }

  context 'deletes a meal food' do
    it 'with correct params' do
      food    = create(:food, meals: [meal])
      message = "Successfully removed #{food.name} from #{meal.name}"
      create_list(:food, 4, meals: [meal])

      expect(meal.foods.length).to eq(5)

      delete "/api/v1/meals/#{meal.id}/foods/#{food.id}"

      expect(response.status).to eq(200)
      expect(json_response[:message]).to eq(message)
    end
  end
  context 'does not delete a meal food' do
    it 'when the meal does not exist' do
      food = create(:food, meals: [meal])

      delete "/api/v1/meals/#{meal.id - 1}/foods/#{food.id}"

      expect(response.status).to eq(404)
    end
    it 'when the food does not exist' do
      food = create(:food, meals: [meal])

      delete "/api/v1/meals/#{meal.id}/foods/#{food.id - 1}"

      expect(response.status).to eq(404)
    end
  end
end
