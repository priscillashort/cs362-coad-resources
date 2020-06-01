require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
	
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

		describe 'GET #show' do
			specify { expect(get(:show, params: { id:'FAKE' })).to redirect_to(new_user_session_path)}
		end

		describe 'GET #edit' do
			specify { expect(get(:edit, params: { id:'FAKE' })).to redirect_to(new_user_session_path)}
		end

		describe 'PATCH #update' do
			specify { expect(patch(:update, params: { id:'FAKE' })).to redirect_to(new_user_session_path)}
		end

		describe 'DELETE #destroy' do
			specify { expect(post(:destroy, params: { id:'FAKE' })).to redirect_to(new_user_session_path)}
		end
	end

	context 'As an organization user' do
		let(:user) { create(:user) }
		before(:each) { sign_in(user) }

		describe 'GET #index' do
			specify {expect(get(:index)).to redirect_to(dashboard_path)}
		end

		describe 'POST #create' do
			specify { expect(post(:create)).to redirect_to(dashboard_path)}
		end

		describe 'GET #new' do
			specify { expect(get(:new)).to redirect_to(dashboard_path)}
		end

		describe 'GET #show' do
			specify { expect(get(:show, params: { id:'FAKE' })).to redirect_to(dashboard_path)}
		end

		describe 'GET #edit' do
			specify { expect(get(:edit, params: { id:'FAKE' })).to redirect_to(dashboard_path)}
		end

		describe 'PATCH #update' do
			specify { expect(patch(:update, params: { id:'FAKE' })).to redirect_to(dashboard_path)}
		end

		describe 'DELETE #destroy' do
			specify { expect(post(:destroy, params: { id:'FAKE' })).to redirect_to(dashboard_path)}
		end
	end

	context 'As an admin user' do
		let(:admin_user) { create(:user, :admin) }
		let(:region) { create(:region) }
		before(:each) { sign_in(admin_user) }

		describe 'GET #index' do
			specify { expect(get(:index)).to be_successful }
		end

		describe 'POST #create' do
			specify { expect(post(:create, params: { region: attributes_for(:region) })).to redirect_to(regions_path)} 
		end

		describe 'GET #new' do
			specify { expect(get(:new)).to be_successful}
		end

		describe 'GET #show' do
			specify { expect(get(:show, params: { id: region.id })).to be_successful}
		end

		describe 'GET #edit' do
			specify { expect(get(:edit, params: { id: region.id })).to be_successful}
		end

		describe 'PATCH #update' do
			specify { expect(patch(:update, params: { id: region.id, region: attributes_for(:region) })).to redirect_to(regions_path + "/#{region.id}")}
		end

		describe 'DELETE #destroy' do
			specify { expect(post(:destroy, params: { id: region.id })).to redirect_to(regions_path)}
		end
	end

end
