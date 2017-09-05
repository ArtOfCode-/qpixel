FactoryGirl.define do
	factory :answer do
		body 'Random text that must respect the validation criterias of length and other staff'
		question
		user
	end
end
