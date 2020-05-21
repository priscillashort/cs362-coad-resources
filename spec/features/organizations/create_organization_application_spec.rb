require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
	before :each do
		@user = create(:user)
		log_in_as(@user)
		visit new_organization_application_path
	end

# Feature: Organization User Creates an Organization Application
# As an organization user
# Given I am on the new application page
# When I fill in the form
# And I click submit
# Then I should see a success message

	# it 'displays a success message when form information is valid' do 
	# 	fill_in "What is your Organization's email?", with: 'Fake@example.com'
	# 	# select @region.name, from: 'Region'
	# 	click_on 'Apply'
	# 	expect(page).to have_content("success")
	# end

	#you can use the name attribute when you can't use the label

	it 'displays a error message when form information is invalid' do 
		click_on 'Apply'
		expect(page).to have_content("can't be blank")
	end
end
