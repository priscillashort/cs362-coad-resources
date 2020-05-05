require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket){ build(:ticket)}

  #let(:ticket){ build_stubbed(:ticket) }
  #let(:open_ticket){ build_stubbed(:ticket, :open) }
  #let(:closed_ticket){ build_stubbed(:ticket, :closed) }
  #let(:open_with_org){ build_stubbed(:ticket, :open, :with_org) }
  #let(:closed_with_org){ build_stubbed(:ticket, :closed, :with_org) }

  describe 'attributes' do
    specify{ expect(ticket).to respond_to(:name) }
    specify{ expect(ticket).to respond_to(:description) }
    specify{ expect(ticket).to respond_to(:phone) }
    specify{ expect(ticket).to respond_to(:organization_id) }
    specify{ expect(ticket).to respond_to(:created_at) }
    specify{ expect(ticket).to respond_to(:updated_at) }
    specify{ expect(ticket).to respond_to(:closed) }
    specify{ expect(ticket).to respond_to(:closed_at) }
    specify{ expect(ticket).to respond_to(:resource_category_id) }
    specify{ expect(ticket).to respond_to(:region_id) }
  end

  describe 'relationships' do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:region_id) }
    it { should validate_presence_of(:resource_category_id) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_length_of(:description).is_at_most(1020).on(:create) }
    #it { should validate(:phone).to be_phony_plausible }
  end

  # TODO: Add scope tests

  # describe '#open' do
  #   it 'gets only open tickets without an organization' do
  #     open_tickets = Ticket.open

  #     expect(open_tickets).to include(open_ticket)
  #     #expect(open_tickets).not_to include(closed_ticket)
  #     expect(open_tickets).not_to include(closed_ticket, open_with_org, closed_with_org)
  #   end
  # end

  describe '#to_s' do
    let(:ticket){ build(:ticket, id: 10)}
    it 'has a string representation that is "Ticket id"' do
      expect(ticket.to_s).to eq('Ticket 10')
    end
  end

  describe '#open' do
    it 'gets the oposite of the closed property' do
      ticket.closed = false
      expect(ticket).to be_open
    end
  end
  
  describe '#captured' do
    let(:ticket){build(:ticket)}
    it 'if it is present it should be true' do
      expect(ticket.captured?).to eq(true)
    end
  end
	

end
