require 'rails_helper'

describe Meal do
  let(:apple)  { create(:food, name: 'apple') }
  let(:banana) { create(:food, name: 'banana') }
  subject { Meal.create(name: 'breakfast', foods: [apple, banana]) }

  context 'field validations' do
    it 'is valid with all attributes' do
      expect(subject).to be_valid
    end
    context 'is invalid without' do
      it 'a name' do
        subject.update(name: nil)

        expect(subject).to_not be_valid
      end
    end
  end
  context 'relationships' do
    it { should have_many :foods}
  end
end
