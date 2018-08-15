require 'rails_helper'

describe 'foods API' do
  let(:food) { create(:food) }
  let(:name) { 'banana' }
  let(:params) { { food: {} } }

  context 'edits a food' do
    it 'with only a name' do
      params[:food][:name] = name

      patch "/api/v1/foods/#{food.id}", params: params

      expect(response.status).to eq(200)
      expect(Food.first.name).to eq(name)
    end
    it 'with only calories' do
      params[:food][:calories] = 50

      patch "/api/v1/foods/#{food.id}", params: params

      expect(response.status).to eq(200)
      expect(Food.first.calories).to eq(50)
    end
    it 'with name and calories' do
      params[:food][:name]     = name
      params[:food][:calories] = 50

      patch "/api/v1/foods/#{food.id}", params: params

      expect(response.status).to eq(200)
      expect(Food.first.name).to eq(name)
      expect(Food.first.calories).to eq(50)
    end
  end
  context 'does not edit a food' do
    it 'without params' do
      patch "/api/v1/foods/#{food.id}"

      expect(response.status).to eq(400)
    end
    it 'with params with nil values' do
      params[:food][:name]     = nil
      params[:food][:calories] = nil

      patch "/api/v1/foods/#{food.id}", params: params

      expect(response.status).to eq(400)
    end
    it 'if the food does not exist' do
      params[:food][:name]     = name
      params[:food][:calories] = 50

      patch "/api/v1/foods/#{food.id - 1}", params: params

      expect(response.status).to eq(404)
    end
  end
end
