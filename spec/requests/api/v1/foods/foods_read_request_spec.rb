require 'rails_helper'

describe 'foods API' do
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
  end
end
