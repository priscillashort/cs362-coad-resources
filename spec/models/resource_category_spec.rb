require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  describe 'attributes' do
    let (:resourceCategory){ ResourceCategory.new }
    specify{ expect(resourceCategory).to respond_to(:name) }
    specify{ expect(resourceCategory).to respond_to(:created_at) }
    specify{ expect(resourceCategory).to respond_to(:updated_at) }
    specify{ expect(resourceCategory).to respond_to(:active) }
  end

	describe 'relationships' do
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:organizations) }
  end

  describe '#to_s' do
    it 'has a string representation that is the name' do
      expected_name = 'FAKE'
      resourceCategory = ResourceCategory.new(name: expected_name)
      expect(resourceCategory.to_s).to eq(expected_name)
    end
  end

end
