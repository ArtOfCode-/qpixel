require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  let(:user) { User.find(answer.user_id) }
  let(:question) { FactoryGirl.create(:question) }
  let(:answer) { FactoryGirl.create(:answer) }

  let(:valid_attributes) {
    build_attributes(:answer)
  }

  let(:invalid_attributes) {
    build_attributes(:answer, body: 'too short')
  }

  before(:each) do
    sign_in user
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, question_id: question
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, question_id: question, :id => answer.to_param
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Answer" do
        expect {
          post :create, :question_id => valid_attributes['question_id'], :answer => valid_attributes
        }.to change(Answer, :count).by(1)
      end

      it "redirects to the created answer" do
        post :create, :question_id => valid_attributes['question_id'], :answer => valid_attributes
        last_answer = Answer.last
        expect(response).to redirect_to(question_path(last_answer.question))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, :question_id => invalid_attributes['question_id'], :answer => invalid_attributes
        expect(response.status).to be(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        build_attributes(:answer, body: 'this is the new attribute that I changed')
      }

      it "updates the requested answer" do
        put :update, :question_id => answer.question_id, :id => answer, :answer => new_attributes
        answer.reload
        expect(answer.body).to eq('this is the new attribute that I changed')
      end

      it "redirects to the answer" do
        put :update, :question_id => answer.question_id, :id => answer, :answer => new_attributes
        expect(response).to redirect_to(question_path(answer.question))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, :question_id => answer.question_id, :id => answer, :answer => invalid_attributes
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested answer" do
      expect {
        delete :destroy, :question_id => answer.question_id, :id => answer
      }.to change(Answer, :count).by(-1)
    end

    it "redirects to the answers list" do
      delete :destroy, :question_id => answer.question_id, :id => answer
      expect(response).to redirect_to(question_url(answer.question))
    end
  end

end
