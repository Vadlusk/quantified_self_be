require 'rails_helper'

describe 'foods API' do
  let(:name) { 'banana' }
  let(:params) { { food: { name: name, calories: 50 } } }

  context 'creates a food' do
    it 'with correct params' do
      post '/api/v1/foods', params: params

      expect(response.status).to eq(201)
      expect(json_response.keys).to contain_exactly(
        :id,
        :name,
        :calories
      )
      expect(json_response[:name]).to eq(name)
      expect(json_response[:calories]).to eq(50)
    end
  end
  context 'does not create a food' do
    it 'if name is missing' do
      params[:food][:name] = nil
      post '/api/v1/foods', params: params

      expect(response.status).to eq(400)
    end
    it 'if calories is missing' do
      params[:food][:calories] = nil
      post '/api/v1/foods', params: params

      expect(response.status).to eq(400)
    end
    it 'if params are missing' do
      post '/api/v1/foods'

      expect(response.status).to eq(400)
    end
  end
end
