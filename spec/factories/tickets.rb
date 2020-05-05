FactoryBot.define do

	factory :ticket do
		name { 'FAKE' }

		trait :with_org do
			organization
		end
	end

	# factory :ticket do
	# 	name: 'FAKE'
	# 	description: 'test ticket'
	# 	region: { build_stubbed(:region) }
	# 	resource_category: { build_stubbed(:resource_category) }
	# 	closed: false
	# 	organization: { build_stubbed(:organization) }
		
	# 	trait :open do
	# 		closed: false
	# 	end
	# 	trait :closed do
	# 		closed: true
	# 	end
	# 	trait :with_org do
	# 		organization: { build_stubbed(:organization) }
	# 	end
	# 	trait :without_org do
	# 		organization: nil
	# 	end
	# end

end
