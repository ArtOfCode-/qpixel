FactoryGirl.define do
	factory :privilege do
  		name 'create'
  		threshold 10

      factory :privilege_with_users do
        transient do 
          user_count 5
        end

        after(:create) do |privilege, evaluator|
          create_list(:user, evaluator.user_count, privileges: [privilege])
        end
      end
	end
end