require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
	before :each do
		@user = create(:user)
		log_in_as(@user)
		visit new_organization_application_path
	end

	it 'displays a success message when form information is valid' do 
		create(:user, :admin)
		fill_in "What is your Organization's email?", with: 'Fake@example.com'
		fill_in "Organization Name", with: 'FAKE'
		fill_in "What is your direct phone number? Cell phone is best.", with: '15555555555'
		fill_in "What is your name? (Last, First)", with: 'FAKE'
		fill_in "Who may we contact regarding your organization's application if we are unable to reach you?", with: 'FAKE'
		fill_in "What is a good secondary phone number we may reach your organization at?", with: '15555555556'
		click_on 'Apply'
		expect(page).to have_content("Submitted")
	end

	it 'displays a error message when form information is invalid' do 
		click_on 'Apply'
		expect(page).to have_content("can't be blank")
	end
end
