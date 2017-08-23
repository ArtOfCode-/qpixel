require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	let(:user) { user = FactoryGirl.create(:user) }
	let(:question) { question = FactoryGirl.create(:question) }

	before(:each) do
		sign_in user
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
			# question.save
			# binding.pry
			get :show, id: question
			expect(response).to be_success
			expect(response).to have_http_status(200)
			expect(response).to render_template(:show)
		end
		it "fills the variable @upvotes"
	end

	describe "GET #new" do
		it "responds successfully with the edit page" do
			get :new
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end
	end

	describe "GET #edit" do
		it "responds successfully with the edit page" # do
			# get :edit, params: {id: question.id}
			# expect(response).to be_success
			# expect(response).to have_http_status(200)
		# end
	end
end