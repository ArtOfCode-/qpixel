require 'rails_helper'

RSpec.describe "Answers", type: :request do
	let(:user) { User.find(answer.user_id) }
	let(:question) { FactoryGirl.create(:question) }
	let(:answer) { FactoryGirl.create(:answer) }

	describe "GET /edit" do
		it "the page edit is displayed after authentication" do
			sign_in user
	  		get edit_question_answer_path(answer.question, answer)
	  		expect(response).to have_http_status(200)
		end
	end
end
