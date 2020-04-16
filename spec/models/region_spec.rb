require 'rails_helper'

RSpec.describe Region, type: :model do

  it 'exists' do
    Region.new
  end

  it 'has a string representation that is the name' do
    region = Region.new(name: 'FAKE')
    expect(region.to_s).to eq('FAKE')
  end

  describe 'relationships' do
    it { should have_many(:tickets) }
  end

end
