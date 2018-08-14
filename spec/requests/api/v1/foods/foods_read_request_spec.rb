require 'rails_helper'

describe 'foods API' do
  let(:food) { create(:food) }

  context 'sends' do
    it 'all foods' do
      create_list(:food, 20)

      get '/api/v1/foods'

      expect(response.status).to eq(200)
      expect(json_response.length).to eq(20)
      json_response.each do |food|
        expect(food.keys).to contain_exactly(
          :id,
          :name,
          :calories
        )
      end
    end
    it 'one specific food' do
      get "/api/v1/foods/#{food.id}"

      expect(response.status).to eq(200)
      expect(json_response.keys).to contain_exactly(
        :id,
        :name,
        :calories
      )
    end
  end
  context 'does not send' do
    context 'one specific food when' do
      it 'the food does not exist' do
        get "/api/v1/foods/#{food.id - 1}"

        expect(response.status).to eq(404)
      end
    end
  end
end
