require 'rails_helper'

RSpec.describe 'Rejecting an organization', type: :feature do

	before :each do
		@organization = create(:organization)
		@admin = create(:user, :admin)
		log_in_as(@admin)
		visit organization_path(@organization)
	end

	context 'As an admin' do
		specify 'I can reject an organization' do
			click_on 'Reject'
			expect(page).to have_content('rejected')
		end
	end

end
