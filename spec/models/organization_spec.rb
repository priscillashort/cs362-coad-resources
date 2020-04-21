require 'rails_helper'

RSpec.describe Organization, type: :model do

  describe 'attributes' do
    let (:organization){ Organization.new }
    specify{ expect(organization).to respond_to(:name) }
    specify{ expect(organization).to respond_to(:status) }
    specify{ expect(organization).to respond_to(:phone) }
    specify{ expect(organization).to respond_to(:email) }
    specify{ expect(organization).to respond_to(:description) }
    specify{ expect(organization).to respond_to(:rejection_reason) }
    specify{ expect(organization).to respond_to(:created_at) }
    specify{ expect(organization).to respond_to(:updated_at) }
    specify{ expect(organization).to respond_to(:liability_insurance) }
    specify{ expect(organization).to respond_to(:primary_name) }
    specify{ expect(organization).to respond_to(:secondary_name) }
    specify{ expect(organization).to respond_to(:secondary_phone) }
    specify{ expect(organization).to respond_to(:title) }
    specify{ expect(organization).to respond_to(:transportation) }
  end

  describe 'relationships' do
    it { should have_many(:users) }
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:resource_categories) }
  end

  describe 'validations' do
    let (:organization){ Organization.new }
    it 'validates email' do
      expect(organization).to validate_presence_of(:email)
    end
    it 'validates name' do
      expect(organization).to validate_presence_of(:name)
    end
    it 'validates phone' do
      expect(organization).to validate_presence_of(:phone)
    end
    it 'validates status' do
      expect(organization).to validate_presence_of(:status)
    end
    it 'validates primary_name' do
      expect(organization).to validate_presence_of(:primary_name)
    end
    it 'validates secondary_name' do
      expect(organization).to validate_presence_of(:secondary_name)
    end
    it 'validates secondary_phone' do
      expect(organization).to validate_presence_of(:secondary_phone)
    end
  end

  describe '#to_s' do
    it 'has a string representation that is the name' do
      expected_name = 'FAKE'
      organization = Organization.new(name: expected_name)
      expect(organization.to_s).to eq(expected_name)
    end
  end

end
