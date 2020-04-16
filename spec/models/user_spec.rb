require 'rails_helper'

RSpec.describe User, type: :model do

  it('exists') do
    User.new
	end
	
  it 'has a string representation that is the email' do
    user = User.new(email: 'FAKE@FAKE.com')
    expect(user.to_s).to eq('FAKE@FAKE.com')
  end

  it 'has an email' do
    user = User.new
    expect(user).to respond_to(:email)
  end

  describe 'relationships' do
    it { should belong_to(:organization) }
  end
    
end
