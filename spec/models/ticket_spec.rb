require 'rails_helper'

RSpec.describe Ticket, type: :model do

  it('exists') do
    Ticket.new
  end

  it 'has a string representation that is the name' do
    ticket = Ticket.new(name: 'FAKE')
    expect(ticket.to_s).to eq('FAKE')
  end

  describe 'relationships' do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization) }
  end

  #This is an alternate syntax for the same test
  #it 'Should belong to a region' do
  #    ticket = Ticket.new
  #    expect(ticket).to respond_to(:region)
  #end

end
