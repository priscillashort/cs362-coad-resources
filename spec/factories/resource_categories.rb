FactoryBot.define do
	factory :resource_category do
		name

		trait :active do
			active {true}
		end

		trait :inactive do
			active {false}
		end
		
	end
end
