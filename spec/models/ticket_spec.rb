require 'rails_helper'

RSpec.describe Ticket, type: :model do

  let(:ticket){ Ticket.new(id: 10) }

  describe 'attributes' do
    # Test the properties listed on the model
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

  # Add validation tests

  describe '#to_s' do
    it 'has a string representation that is "Ticket id"' do
      expect(ticket.to_s).to eq('Ticket 10')
    end
  end

  # Add class method tests

end
