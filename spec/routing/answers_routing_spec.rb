require "rails_helper"

RSpec.describe AnswersController, type: :routing do
  describe "routing" do

    let(:answer) { FactoryGirl.create(:answer) }
    let(:question) { Question.find(answer.question_id)}
    let(:answer_id) { answer.id.to_s }
    let(:question_id) { question.id.to_s }

    it "routes to #new" do
     expect(:get => "questions/#{question.id}/answers/new").to route_to("answers#new", :question_id => question_id)
    end

    it "routes to #show" do
      expect(:get => "questions/#{question.id}/answers/#{answer.id}").to route_to("answers#show", :question_id => question_id, :id => answer_id)
    end

    it "routes to #edit" do
      expect(:get => "questions/#{question.id}/answers/#{answer.id}/edit").to route_to("answers#edit", :question_id => question_id, :id => answer_id)
    end

    it "routes to #create" do
      expect(:post => "questions/#{question.id}/answers").to route_to("answers#create", :question_id => question_id)
    end

    it "routes to #update via PUT" do
      expect(:put => "questions/#{question_id}/answers/#{answer_id}").to route_to("answers#update", :question_id => question_id, :id => answer_id)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "questions/#{question_id}/answers/#{answer_id}").to route_to("answers#update", :question_id => question_id, :id => answer_id)
    end

    it "routes to #destroy" do
      expect(:delete => "questions/#{question_id}/answers/#{answer_id}").to route_to("answers#destroy", :question_id => question_id, :id => answer_id)
    end

  end
end
