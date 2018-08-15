require 'rails_helper'

describe 'foods API' do
  let(:food) { create(:food) }
  context 'deletes a food' do
    it 'with correct usage' do
      delete "/api/v1/foods/#{food.id}"

      expect(response.status).to eq(204)
      expect { Food.find(food.id) } .to raise_error(ActiveRecord::RecordNotFound)
    end
  end
  context 'does not delete a food' do
    it 'if the food does not exist' do
      delete "/api/v1/foods/#{food.id - 1}"

      expect(response.status).to eq(404)
    end
  end
end
