FactoryBot.define do
	#factory :default_region, class: 'Region' do
	factory :region, class: 'Region' do
		name { 'FAKE' }
		#tickets { [build_stubbed(:ticket, :closed), build_stubbed(:ticket, :open)] }
		tickets { build_list(:ticket, 1) }

		# trait :unspecified do
		# 	name { 'Unspecified' }
		# end
	end

	factory :unspecified_region, class: 'Region' do
		name { 'Unspecified' }
	end
end
