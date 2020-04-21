require 'rails_helper'

RSpec.describe Region, type: :model do

  it 'exists' do
    Region.new
  end

  it 'has a string representation that is the name' do
    region = Region.new(name: 'FAKE')
    expect(region.to_s).to eq('FAKE')
  end

  describe 'attributes' do
    let (:region){ Region.new }
    specify{ expect(region).to respond_to(:name) }
    specify{ expect(region).to respond_to(:created_at) }
    specify{ expect(region).to respond_to(:updated_at) }
  end

  describe 'relationships' do
    it { should have_many(:tickets) }
  end

end
