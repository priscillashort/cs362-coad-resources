FactoryBot.define do
	#factory :default_region, class: 'Region' do
	factory :region, class: 'Region' do
		name
		#tickets { [build_stubbed(:ticket, :closed), build_stubbed(:ticket, :open)] }
		#tickets { build_list(:ticket, 1) }

		#trait :create_tickets do
		#	tickets { create_list(:ticket, 1) }
		#end

		trait :unspecified do
			name { 'Unspecified' }
		end

	end
end
