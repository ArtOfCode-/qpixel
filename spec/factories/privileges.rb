FactoryGirl.define do
	factory :privilege do
  		user
  		name 'create'
  		threshold:integer

  		factory :privilege_with_users do
  			transient do 
  				users_count 5
  			end

  			after(:create) do |privilege, evaluator|
  				create_list(:user, evaluator.users_count, privileges: [privilege])
  			end
  		end
	end
end
