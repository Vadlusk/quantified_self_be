require 'rails_helper'

describe 'meals API' do
  let(:meal) { create(:meal) }
  context 'sends' do
    it 'all meals' do
      create_list(:meal, 20)

      get '/api/v1/meals'

      expect(response.status).to eq(200)
      expect(json_response.length).to eq(20)
      json_response.each do |meal|
        expect(meal.keys).to contain_exactly(
          :id,
          :name,
          :foods
        )
        expect(meal[:foods]).to eq([])
      end
    end
    it 'a specific meal' do
      get "/api/v1/meals/#{meal.id}/foods"

      expect(response.status).to eq(200)
      expect(json_response.keys).to contain_exactly(
        :id,
        :name,
        :foods
      )
      json_response[:foods].each do |food|
        expect(food.keys).to contain_exactly(
          :id,
          :name,
          :calories
        )
      end
    end
  end
  context 'does not send' do
    context 'a specific meal' do
      it 'if the meal does not exist' do
        get "/api/v1/meals/#{meal.id - 1}/foods"

        expect(response.status).to eq(404)
      end
    end
  end
end
