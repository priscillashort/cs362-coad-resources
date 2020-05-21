require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do

	before :each do
		#@region = create(:region)
		#@resource_category = create(:recource_category)
		@region = Region.create(name: 'Fake Region')
		@resource_category = ResourceCategory.create(name: 'Fake Resource Category')
		visit new_ticket_path
	end

	it 'displays a success message' do 
		fill_in 'Full Name', with: 'Fake Name'
		fill_in 'Phone Number', with: '5555555555'
		select @region.name, from: 'Region'
		select @resource_category.name, from: 'Resource Category'
		fill_in 'Description', with: 'Fake'
		click_on 'Send this help request'
		expect(page).to have_content('Ticket Submitted')
	end

	it 'displays a error message when phone is invalid' do 
		fill_in 'Full Name', with: 'Fake Name'
		fill_in 'Phone Number', with: 'INVALID'
		select @region.name, from: 'Region'
		select @resource_category.name, from: 'Resource Category'
		fill_in 'Description', with: 'Fake'
		click_on 'Send this help request'
		expect(page).to have_content("error")
	end

end
