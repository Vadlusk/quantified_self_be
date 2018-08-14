require 'rails_helper'

describe 'foods API' do
  context 'sends' do
    it 'all foods' do
      create_list(:food, 20)
      get 'api/v1/foods'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(json.length).to eq(20)
      json.each do |food|
        expect(food).to contain_exactly(
          :id,
          :name,
          :calories
        )
      end
    end
  end
end
