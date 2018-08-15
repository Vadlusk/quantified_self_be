require 'rails_helper'

describe 'meals API' do
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
  end
end
