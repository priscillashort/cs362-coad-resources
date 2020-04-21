require 'rails_helper'

RSpec.describe Ticket, type: :model do

  it('exists') do
    Ticket.new
  end

  it 'has a string representation that is "Ticket id"' do
    ticket = Ticket.new(id: 10)
    expect(ticket.to_s).to eq('Ticket 10')
  end

  describe 'attributes' do
    let (:ticket){ Ticket.new }
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

end
