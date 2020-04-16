require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

	it('exists') do
    ResourceCategory.new
	end

  it 'has a string representation that is the name' do
    resourceCategory = ResourceCategory.new(name: 'FAKE')
    expect(resourceCategory.to_s).to eq('FAKE')
  end

	describe 'relationships' do
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:organizations) }
  end

end
