require 'rails_helper'

RSpec.describe 'Viewing home screen', type: :feature do
	
	it 'displays a Get Help button' do
		visit(root_path)
		expect(page).to have_link('Get Help')
	end
	
end