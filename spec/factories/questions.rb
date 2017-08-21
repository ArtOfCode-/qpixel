FactoryGirl.define do 
	factory :question do 
		title "What is the best way to learn to code?"
		body "What is the best way to learn to code? I want to learn ruby on rails and I have no money"	
		tags ["ruby-on-rails", "javascript", "css", "html", "jquery"]
	end

	factory :invalid_question, :parent => :question do
		title "What is the best way to learn to code?"
		body "What is the best way to learn to code? I want to learn ruby on rails and I have no money"	
		tags ["ruby-on-rails", "javascript", "css", "html", "jquery", "some-other-tag"]
	end
end