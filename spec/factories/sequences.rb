FactoryBot.define do
	sequence :email do |n|
		"FAKE#{n}@example.com"
	end
end