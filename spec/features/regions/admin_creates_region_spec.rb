require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do

	before :each do
		@admin = create(:user, :admin)
		log_in_as(@admin)
		visit new_region_path
	end

  context 'As an admin' do
    specify 'I can create a region and see it in the list' do
			fill_in 'Name', with: 'Fake Region'
			click_on 'Add Region'
			visit regions_path
			expect(page).to have_content('Fake Region')
    end
  end

end
