require 'rails_helper'

RSpec.describe Region, type: :model do

  describe 'attributes' do
    let (:region){ Region.new }
    specify{ expect(region).to respond_to(:name) }
    specify{ expect(region).to respond_to(:created_at) }
    specify{ expect(region).to respond_to(:updated_at) }
  end

  describe 'relationships' do
    it { should have_many(:tickets) }
  end

  #describe 'validations' do
    #it 'is not valid without a name' do

    #end
  #end

  #Member function
  describe '#to_s' do
    it 'has a string representation that is the name' do
      expected_name = 'FAKE'
      region = Region.new(name: expected_name)
      expect(region.to_s).to eq(expected_name)
    end
  end

  #Class function
  #describe '::unspecified' do
    #itx 'TODO' do
      #pending
    #end
  #end

end
