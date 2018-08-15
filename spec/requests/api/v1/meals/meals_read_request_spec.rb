require 'rails_helper'

describe 'meals API' do
  context 'sends' do
    it 'all meals' do
      list = create_list(:meal, 20)

      get '/api/v1/meals'

      expect(response.status).to eq(200)
      expect(json_response.length).to eq(20)
      expect(json_response.keys).to contain_exactly(
        :id,
        :name,
        :foods
      )
      expect(json_response[:foods]).to eq([])
    end
  end
end
