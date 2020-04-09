require 'rails_helper'

RSpec.describe Organization, type: :model do

  describe 'relationships' do
    it { should have_many(:users) }
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:resource_categories) }
  end

end
