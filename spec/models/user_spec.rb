require 'rails_helper'

RSpec.describe User, type: :model do

  #let(:user){ build_stubbed(:user) }
  let(:user){ build(:user) }

  describe 'attributes' do
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

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) }
    #it { should validate_format_of(:email).with(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password).on(:create) }
    it { should validate_length_of(:password).is_at_least(7).is_at_most(255).on(:create) }
  end

  # TODO: Add scope tests

  describe '#to_s' do
    it 'has a string representation that is the email' do
      user = build(:user, email: 'FAKE1@example.com')
      expect(user.to_s).to eq('FAKE1@example.com')
    end
  end


  describe '#set_defualt_role'do
    it 'if no role, it will make it an org' do
      user = build(:user)
      user.set_default_role
      expect(user.role).to eq("organization")
    end

    it 'if it has role, set default will not override it' do
      user = build(:user, role: :admin)
      user.set_default_role
      expect(user.role).to eq("admin")
    end
  end

end
