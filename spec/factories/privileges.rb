FactoryGirl.define do
  factory :privilege do
    name "close"
    threshold 250

    factory :privilege_with_users do 
    	transient do
    		users_count 5
    	end

    	after(:create) do |privilege, evaluator| 
    		create_list(:user, evaluator.users_count, privileges: [privilege] )
    	end
    end

  end
end