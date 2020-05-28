FactoryBot.define do

	factory :ticket do
		name { 'FAKE' }
		description {'test ticket'}
		region
		resource_category
		phone { '15555555556' }
		closed {false}
		#region { build_stubbed(:region) }
		#resource_category: { build_stubbed(:resource_category) }
		#organization: { build_stubbed(:organization) }

		trait :open do
			closed {false}
		end

		trait :closed do
			closed {true}
		end

		trait :with_org do
			organization
		end

		trait :without_org do
			organization {nil}
		end
	end

end
