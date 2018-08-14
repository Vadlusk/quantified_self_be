require 'rails_helper'

describe Food do
  subject { Food.create(name: 'banana', calories: 40) }

  context 'field validations' do
    it 'is valid with all attributes' do
      expect(subject).to be_valid
    end
    context 'is invalid without' do
      it 'a name' do
        subject.update(name: nil)

        expect(subject).to_not be_valid
      end
      it 'calories' do
        subject.update(calories: nil)

        expect(subject).to_not be_valid
      end
    end
  end
end
