require 'rails_helper'

RSpec.describe Ticket, type: :model do

  it('exists') do
    Ticket.new
  end

  describe 'relationships' do
    it { should belong_to(:region) }
  end

  #This is an alternate syntax for the same test
  #it 'Should belong to a region' do
  #    ticket = Ticket.new
  #    expect(ticket).to respond_to(:region)
  #end

end
