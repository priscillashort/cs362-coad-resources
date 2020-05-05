FactoryBot.define do
	factory :user do
		#email { 'FAKE@FAKE.com' }
		email
		password { 'fake password' }

		trait :admin do
			role { 'admin' }
		end

		trait :organization_approved do
			role { 'organization' }
			#organization
			#organization_id { create(:organization, :aproved true) }
		end

		after(:create) do |user|
			user.confirm
		end
	end
end