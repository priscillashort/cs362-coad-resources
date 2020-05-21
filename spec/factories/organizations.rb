FactoryBot.define do
	factory :organization do
		email { 'FAKE@example.com' }
		name { 'FAKE' }
		phone { '15555555555' }
		primary_name { 'prime' }
		secondary_name { 'sec' }
		secondary_phone { '15555555556' }
	end
end

