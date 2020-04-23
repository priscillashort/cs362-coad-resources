require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resourceCategory){ ResourceCategory.new(name: 'FAKE') }

  describe 'attributes' do
    # Test the properties listed on the model
    specify{ expect(resourceCategory).to respond_to(:name) }
    specify{ expect(resourceCategory).to respond_to(:created_at) }
    specify{ expect(resourceCategory).to respond_to(:updated_at) }
    specify{ expect(resourceCategory).to respond_to(:active) }
  end

	describe 'relationships' do
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:organizations) }
  end

  # Add validation tests

  describe '#to_s' do
    it 'has a string representation that is the name' do
      expect(resourceCategory.to_s).to eq('FAKE')
    end
  end

  # Add class method tests

end
