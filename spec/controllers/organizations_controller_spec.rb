require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

	context 'As a public user' do
		describe 'GET #index' do
			specify { expect(get(:index)).to redirect_to(new_user_session_path)}
		end

		describe 'POST #create' do
			specify { expect(post(:create)).to redirect_to(new_user_session_path)}
		end

		describe 'GET #new' do
			specify { expect(get(:new)).to redirect_to(new_user_session_path)}
		end

		#describe 'GET #show' do
		#	specify { expect(get(:show, params: { id:'FAKE' })).to redirect_to(new_user_session_path)}
		#end

		describe 'GET #edit' do
			specify { expect(get(:edit, params: { id:'FAKE' })).to redirect_to(new_user_session_path)}
		end

		describe 'PATCH #update' do
			specify { expect(patch(:update, params: { id:'FAKE' })).to redirect_to(new_user_session_path)}
		end

		describe 'DELETE #reject' do
			specify { expect(post(:reject, params: { id:'FAKE' })).to redirect_to(new_user_session_path)}
		end
	end

	context 'As an organization user' do
		let(:user) { create(:user) }
		before(:each) { sign_in(user) }

		#describe 'GET #index' do
		#	specify { expect(get(:index)).to be_successful }
		#end

		describe 'POST #create' do
			specify { expect(post(:create, params: { organization: attributes_for(:organization) } )).to be_successful }

		end

		# describe 'POST #create' do
		# 	specify { expect(post(:create, params: {
		# 		name: 'FAKE',
		# 		phone: '5555555555',new
		# 		email: 'FAKE@example.com',
		# 		# :description,
		# 		# :liability_insurance,
		# 		# :primary_name,
		# 		# :secondary_name,
		# 		# :secondary_phone,
		# 		# :title 
		# 	}
		# 	)).to redirect_to(organization_application_submitted_path)}
		# end

		describe 'GET #new' do
			specify { expect(get(:new)).to be_successful}
		end

		#describe 'GET #show' do
		# 	specify { expect(get(:show, params: { id:'FAKE' })).to be_successful}
		#end

		#describe 'GET #edit' do
		#	specify { expect(get(:edit, params: { id:'FAKE' })).to be_successful}
		#end

		# describe 'PATCH #update' do
		# 	specify { expect(patch(:update, params: { id:'FAKE' })).to redirect_to(new_user_session_path)}
		# end

		describe 'DELETE #destroy' do
			specify { expect(post(:reject, params: { id:'FAKE' })).to redirect_to(dashboard_path)}
		end
	end

	context 'As an admin user' do
		let(:admin_user) { create(:user, :admin) }
		before(:each) { sign_in(admin_user) }

		describe 'GET #index' do
			specify { expect(get(:index)).to be_successful }
		end

		# describe 'POST #create' do
		# 	specify { expect(post(:create, params: { organization: attributes_for(:organization) } )).to redirect_to(organization_application_submitted_path)}
		# end

	end

end
