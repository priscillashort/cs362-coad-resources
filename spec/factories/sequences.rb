FactoryBot.define do

	sequence :email do |n|
		"FAKE#{n}@example.com"
	end

	sequence :name do |n|
		"FAKE#{n}"
	end
	
end