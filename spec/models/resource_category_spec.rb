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

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe '#to_s' do
    it 'has a string representation that is the name' do
      expect(resourceCategory.to_s).to eq('FAKE')
    end
  end

  # Add class method tests

end
