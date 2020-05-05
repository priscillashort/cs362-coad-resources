FactoryBot.define do
	factory :organization do
		email { 'FAKE@example.com' }
		name { 'FAKE' }
		phone { '5555555555' }
		# TODO: Add :status, :primary_name, :secondary_name, :secondary_phone
	end
end

