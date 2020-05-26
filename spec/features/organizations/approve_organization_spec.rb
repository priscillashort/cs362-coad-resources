require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
	
	before :each do
		@organization = create(:organization)
		@admin = create(:user, :admin)
		log_in_as(@admin)
		visit organization_path(@organization)
	end

	context 'As an admin' do
		specify 'I can approve an organization' do
			click_on 'Approve'
			expect(page).to have_content('approved')
		end
	end

end
