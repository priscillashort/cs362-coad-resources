require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket){ build(:ticket)}
  let(:ticket_with_org){ build(:ticket, :with_org)}

  let(:open_ticket){ create(:ticket, :open) }
  let(:closed_ticket){ create(:ticket, :closed) }
  let(:open_with_org){ create(:ticket, :open, :with_org) }
  let(:closed_with_org){ create(:ticket, :closed, :with_org) }

  describe 'attributes' do
    specify{ expect(ticket).to respond_to(:name) }
    specify{ expect(ticket).to respond_to(:description) }
    specify{ expect(ticket).to respond_to(:phone) }
    specify{ expect(ticket).to respond_to(:closed) }
    specify{ expect(ticket).to respond_to(:closed_at) }
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

  describe 'scope' do
    describe '#open' do
      it 'gets only open tickets without an organization' do
        open_tickets = Ticket.open
        expect(open_tickets).to include(open_ticket)
        expect(open_tickets).not_to include(closed_ticket, open_with_org, closed_with_org)
      end
    end

    describe '#closed' do
      it 'gets only closed tickets' do
        closed_tickets = Ticket.closed
        expect(closed_tickets).to include(closed_ticket, closed_with_org)
        expect(closed_tickets).not_to include(open_ticket, open_with_org)
      end
    end

    describe '#all_organization' do
      it 'gets only open tickets with an organization' do
        all_organization_tickets = Ticket.all_organization
        expect(all_organization_tickets).to include(open_with_org)
        expect(all_organization_tickets).not_to include(closed_ticket, closed_with_org, open_ticket)
      end
    end

    describe '#organization' do
      it 'gets only open tickets with a particular organization' do
        organization_tickets = Ticket.organization(open_with_org.organization_id)
        expect(organization_tickets).to include(open_with_org)
        expect(organization_tickets).not_to include(closed_ticket, closed_with_org, open_ticket)
      end
    end

    describe '#closed_organization' do
      it 'gets only closed tickets with a particular organization' do
        closed_organization_tickets = Ticket.closed_organization(closed_with_org.organization_id)
        expect(closed_organization_tickets).to include(closed_with_org)
        expect(closed_organization_tickets).not_to include(closed_ticket, open_with_org, open_ticket)
      end
    end

    describe '#region' do
      it 'gets only tickets with a particular region' do
        region_tickets = Ticket.region(open_ticket.region_id)
        expect(region_tickets).to include(open_ticket)
        expect(region_tickets).not_to include(closed_ticket, closed_with_org, open_with_org)
      end
    end

    describe '#resource_category' do
      it 'gets only tickets with a particular resource_category' do
        resource_category_tickets = Ticket.resource_category(open_ticket.resource_category_id)
        expect(resource_category_tickets).to include(open_ticket)
        expect(resource_category_tickets).not_to include(closed_ticket, closed_with_org, open_with_org)
      end
    end
  end

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
    it 'ticket is not captured by default' do
      expect(ticket).to_not be_captured
    end

    it 'ticket is captured if it has an organization' do
      expect(ticket_with_org).to be_captured
    end
  end
	
end
