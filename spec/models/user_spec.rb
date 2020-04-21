require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'attributes' do
    let (:user){ User.new }
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
    
  describe '#to_s' do
    it 'has a string representation that is the email' do
      expected_email = 'FAKE@FAKE.com'
      user = User.new(email: expected_email)
      expect(user.to_s).to eq(expected_email)
    end
  end

end
