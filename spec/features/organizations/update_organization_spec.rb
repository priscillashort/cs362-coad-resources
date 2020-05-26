require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do

	# let(:organization) { create(:organization) }

	before :each do
		@organization = create(:organization)
		@admin = create(:user, :admin)
		log_in_as(@admin)
		visit edit_organization_path(@organization)
	end

	# context 'As an admin' do
	# 	specify 'I can edit an organization name' do
	# 		# visit edit_organization_path(@organization)
	# 		fill_in(:name).with('New Fake Name')
	# 		click_on 'Save'
	# 		expect(page).to have_content('New Fake Name')
	# 	end
	# end
end
