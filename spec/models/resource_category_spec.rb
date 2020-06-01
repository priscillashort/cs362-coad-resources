require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

  let(:resourcecategory){ build(:resource_category, name: 'FAKE') }

  let(:active_resourcecategory){ create(:resource_category, :active) }
  let(:inactive_resourcecategory){ create(:resource_category, :inactive) }

  describe 'attributes' do
    specify{ expect(resourcecategory).to respond_to(:name) }
    specify{ expect(resourcecategory).to respond_to(:active) }
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

  describe '#active' do
    it 'gets only active resource categories' do
      active_resource_categories = ResourceCategory.active
      expect(active_resource_categories).to include(active_resourcecategory)
      expect(active_resource_categories).not_to include(inactive_resourcecategory)
    end
  end

  describe '#inactive' do
    it 'gets only inactive resource categories' do
      inactive_resource_categories = ResourceCategory.inactive
      expect(inactive_resource_categories).to include(inactive_resourcecategory)
      expect(inactive_resource_categories).not_to include(active_resourcecategory)
    end
  end

  describe '#to_s' do
    it 'has a string representation that is the name' do
      expect(resourcecategory.to_s).to eq('FAKE')
    end
  end

  describe '::unspecified' do
    it 'creates a new Unspecified ResourceCategory when one does not exist' do
      expect(ResourceCategory.where(name: 'Unspecified')).to be_empty
      expect{ ResourceCategory.unspecified }.to change { ResourceCategory.count }.by(1)
    end
    it 'does not create a new Unspecified ResourceCategory when one already exists' do
      ResourceCategory.create(name: 'Unspecified')
      expect{ ResourceCategory.unspecified }.to_not change { ResourceCategory.count }
    end
    it 'returns a ResourceCategory with the name Unspecified' do
      expect(ResourceCategory.unspecified.name).to eq('Unspecified')
    end
  end

  describe '#activate' do
    it 'activates a database record' do
      inactive_resourcecategory.activate
      expect(inactive_resourcecategory).to be_active
      expect(inactive_resourcecategory).not_to be_inactive
    end
  end

  describe '#deactivate' do
    it 'deactivate a database record' do
      active_resourcecategory.deactivate
      expect(active_resourcecategory).to be_inactive
      expect(active_resourcecategory).not_to be_active
    end
  end

end
