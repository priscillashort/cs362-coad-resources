FactoryBot.define do
	factory :region do
		name { 'FAKE' }
		#tickets { [build_stubbed(:ticket, :closed), build_stubbed(:ticket, :open)] }

		trait :unspecified do
			name { 'Unspecified' }
		end
	end
end
