require 'rails_helper'

RSpec.describe User, type: :model do

  it('exists') do
    User.new
  end

  describe 'relationships' do
    it { should belong_to(:organization) }
  end
    
end
