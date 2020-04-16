require 'rails_helper'

RSpec.describe Organization, type: :model do

  it('exists') do
    Organization.new
  end

  it 'has a string representation that is the name' do
    organization = Organization.new(name: 'FAKE')
    expect(organization.to_s).to eq('FAKE')
  end

  describe 'relationships' do
    it { should have_many(:users) }
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:resource_categories) }
  end

end
