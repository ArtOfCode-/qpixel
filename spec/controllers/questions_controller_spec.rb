require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	let(:user) { user = FactoryGirl.create(:user) }
	# let(:question) { question = FactoryGirl.create(:question) }
	let(:user_with_questions) { user_with_questions = FactoryGirl.create(:user_with_questions) }
	let(:question) { user_with_questions.questions.first }
	# let(:user_question) { user_question = user.questions.first }

	before(:each) do
		sign_in user_with_questions
	end

	describe "GET #index" do
		it "responds successfull with the index page" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "saves a @questions variable with all the questions" do
			get :index
			expect(assigns[:questions]).to_not be_empty
		end
	end

	describe "GET #show" do
		it "responds successfull with the show page" do
			get :show, id: question
			expect(response).to be_success
			expect(response).to have_http_status(200)
			expect(response).to render_template(:show)
		end		
		it "creates a variable @upvotes" do
			get :show, id: question
			upvotes = assigns[:upvotes]
			expect(upvotes).to be(0)
			expect(upvotes).to be_present
		end
	end

	describe "GET #tagged" do
		it "renders the correct view" do 
			get :tagged, tag: "ruby-on-rails"
			expect(response).to be_success
		end

		it "find the question with the correct tag" do
			get :tagged, tag: "ruby-on-rails"
			expect(assigns[:questions]).to_not be_empty
		end
	end

	describe "GET #new" do
		it "responds successfully with the edit page" do
			get :new
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
		it "responds with the correct form" do
			get :new
			expect(response).to render_template("new")
		end
	end

	describe "GET #edit" do
		it "responds successfully with the edit page" do
			get :edit, id: user_with_questions.questions.first
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
	end

	describe "PATCH #update" do 
		it "updates correctly the question" do
			patch :update, id: question, question: FactoryGirl.attributes_for(:question, title: 'Updated new title long enought')
			expect(assigns[:question].title).to eq('Updated new title long enought')
		end
	end
end