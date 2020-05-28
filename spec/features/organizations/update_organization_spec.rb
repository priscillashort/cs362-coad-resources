require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do

	let(:admin) { create(:user, :admin) }
	let(:organization) { create(:organization, :approved) }

	before do
		create(:user, organization: organization)
		log_in_as(admin)
	end

	context 'As an admin' do
		specify 'I can edit an organization' do
			visit organization_path(organization)
			click_on('Edit Organization', exact: true)
			expect(current_path).to eq edit_organization_path(organization)
		end

		specify 'I can edit an organization name' do
			visit edit_organization_path(organization)
			fill_in 'Name', with: 'Fake New Name'
			click_on 'Update Resource'
			expect(page).to have_content('Fake New Name')
		end

		specify 'I can edit an organization phone' do
			visit edit_organization_path(organization)
			fill_in 'Phone', with: '15555556666'
			click_on 'Update Resource'
			expect(page).to have_content('15555556666')
		end

		specify 'I can edit an organization email' do
			visit edit_organization_path(organization)
			fill_in 'Email', with: 'FakeNewEmail@example.com'
			click_on 'Update Resource'
			expect(page).to have_content('FakeNewEmail@example.com')
		end

		specify 'I can edit an organization description' do
			visit edit_organization_path(organization)
			fill_in 'Description', with: 'Fake New Description'
			click_on 'Update Resource'
			expect(page).to have_content('Fake New Description')
		end
	end

end
