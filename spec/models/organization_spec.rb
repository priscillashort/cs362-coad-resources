require 'rails_helper'

RSpec.describe Organization, type: :model do

  let(:organization){ build(:organization, name: 'FAKE') }

  describe 'attributes' do
    specify{ expect(organization).to respond_to(:agreement_one) }
    specify{ expect(organization).to respond_to(:agreement_two) }
    specify{ expect(organization).to respond_to(:agreement_three) }
    specify{ expect(organization).to respond_to(:agreement_four) }
    specify{ expect(organization).to respond_to(:agreement_five) }
    specify{ expect(organization).to respond_to(:agreement_six) }
    specify{ expect(organization).to respond_to(:agreement_seven) }
    specify{ expect(organization).to respond_to(:agreement_eight) }
    specify{ expect(organization).to respond_to(:name) }
    specify{ expect(organization).to respond_to(:status) }
    specify{ expect(organization).to respond_to(:phone) }
    specify{ expect(organization).to respond_to(:email) }
    specify{ expect(organization).to respond_to(:description) }
    specify{ expect(organization).to respond_to(:rejection_reason) }
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
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:primary_name) }
    it { should validate_presence_of(:secondary_name) }
    it { should validate_presence_of(:secondary_phone) }
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
    #it { should validate_format_of(:email).with(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:description).is_at_most(1020).on(:create) }
  end

  describe '#to_s' do
    it 'has a string representation that is the name' do
      expect(organization.to_s).to eq('FAKE')
    end
  end

  describe 'approve' do
    let(:organization){build_stubbed(:organization, status: :rejected)}
    it 'using approve on an org should approve it' do
      organization.approve
      expect(organization.status).to eq("approved")
    end
  end

  describe 'reject' do
    let(:organization){build_stubbed(:organization, status: :approved)}
    it 'rejecting should mean it is rejected' do
      organization.reject
      expect(organization.status).to eq("rejected")
    end
  end

  describe 'default status' do
    let(:organization){build_stubbed(:organization)}
    it 'if no status, change to default status' do
      organization.set_default_status
      expect(organization.status).to eq("submitted")
    end
  end

  describe 'default status no override' do
    let(:organization){build_stubbed(:organization, status: :approved)}
    it 'set default status keeps the status if one exists' do
      organization.set_default_status
      expect(organization.status).to eq("approved")
    end
  end
 	
end
