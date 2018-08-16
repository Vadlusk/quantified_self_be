require 'rails_helper'

describe 'meal foods API' do
  let(:meal) { create(:meal) }
  let(:food) { create(:food) }
  let(:message) { "Successfully added #{food.name} to #{meal.name}" }

  context 'creates a meal food' do
    it 'with correct params' do
      post "/api/v1/meals/#{meal.id}/foods/#{food.id}"

      expect(response.status).to eq(201)
      expect(json_response[:message]).to eq(message)
      expect(meal.foods.first.name).to eq(food.name)
    end
  end
  context 'does not create a meal food' do
    it 'if the food does not exist' do
      post "/api/v1/meals/#{meal.id}/foods/#{food.id - 1}"

      expect(response.status).to eq(404)
    end
    it 'if the meal does not exist' do
      post "/api/v1/meals/#{meal.id - 1}/foods/#{food.id}"

      expect(response.status).to eq(404)
    end
  end
end
