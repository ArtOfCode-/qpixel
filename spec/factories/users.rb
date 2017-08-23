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

  end
end
