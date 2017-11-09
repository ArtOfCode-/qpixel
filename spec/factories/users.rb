FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    reputation 1

    factory :user_with_questions do

      transient do 
        question_count 5
      end
      after(:create) do |user, evaluator|
        create_list(:question, evaluator.question_count, user: user )
      end

    end

    factory :user_with_answers do
      transient do
        answer_count 5
      end
      after(:create) do |user, evaluator|
        create_list(:answer, evaluator.answer_count, user: user)
      end
    end

    factory :user_with_privileges do
      transient do 
        privilege_count 1
      end
      after(:create) do |user, evaluator|
        create_list(:privilege, evaluator.privilege_count, users: [user])
      end
    end

  end
end


=begin
    factory :user_with_privileges do 
      privileges { |privileges| [privileges.association(:privilege)]}
    end
=end