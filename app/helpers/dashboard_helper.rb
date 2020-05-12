module DashboardHelper

  def dashboard_for(user)
    if user.admin?
      'admin_dashboard'
    elsif user.organization&.submitted?
      'organization_submitted_dashboard'
    elsif user.organization&.approved?
      'organization_approved_dashboard'
    else
      'create_application_dashboard'
    end
  end

end

# describe '#dashbaord_for' do

#   class FakeOrganization
#     def submitted?
#       true
#     end
#   end

#   class FakeUser
#     def admin?
#       true
#     end

#     def organization
#       FakeOrganization.new
#     end
#   end

#   it 'returns admin_dashboard' do
#     user = FakeUser.new
#     user = double()
#     user.stub(:admin?, true)
#     expect(dashboard_for(user)).to eq('admin_dashboard')
#   end

#   it 'returns organization_submitted_dashboard' do
#     user = FakeUser.new
#     user.stub(:admin?, false)
#     expect(dashboard_for(user)).to eq('organization_submitted_dashboard')
#   end

# end