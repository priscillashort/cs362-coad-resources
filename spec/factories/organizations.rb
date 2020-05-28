FactoryBot.define do
	factory :organization do
		email
		name
		phone { '15555555555' }
		primary_name { 'prime' }
		secondary_name { 'sec' }
		secondary_phone { '15555555556' }

		trait :approved do
			status {:approved}
		end

	end
end

