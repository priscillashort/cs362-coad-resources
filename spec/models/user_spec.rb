require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user){ User.new(email: 'FAKE@FAKE.com') }

  describe 'attributes' do
    # Test the properties listed on the model
    specify{ expect(user).to respond_to(:email) }
    specify{ expect(user).to respond_to(:encrypted_password) }
    specify{ expect(user).to respond_to(:reset_password_token) }
    specify{ expect(user).to respond_to(:reset_password_sent_at) }
    specify{ expect(user).to respond_to(:remember_created_at) }
    specify{ expect(user).to respond_to(:created_at) }
    specify{ expect(user).to respond_to(:updated_at) }
    specify{ expect(user).to respond_to(:confirmation_token) }
    specify{ expect(user).to respond_to(:confirmed_at) }
    specify{ expect(user).to respond_to(:confirmation_sent_at) }
    specify{ expect(user).to respond_to(:unconfirmed_email) }
    specify{ expect(user).to respond_to(:role) }
    specify{ expect(user).to respond_to(:organization_id) }
  end

  describe 'relationships' do
    it { should belong_to(:organization) }
  end

  # Add validation tests
    
  # Add scope tests

  describe '#to_s' do
    it 'has a string representation that is the email' do
      expect(user.to_s).to eq('FAKE@FAKE.com')
    end
  end

  # Add class method tests

end
