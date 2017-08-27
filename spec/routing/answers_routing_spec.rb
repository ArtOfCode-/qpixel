require "rails_helper"

RSpec.describe AnswersController, type: :routing do
  describe "routing" do

    # it "routes to #index" do
      # expect(:get => "/answers").to route_to("answers#index")
    # end

    it "routes to #new" do
      expect(:get => "questions//answers/new").to route_to("answers#new")
    end

    it "routes to #show" do
      expect(:get => "/answers/1").to route_to("answers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/answers/1/edit").to route_to("answers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/answers").to route_to("answers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/answers/1").to route_to("answers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/answers/1").to route_to("answers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/answers/1").to route_to("answers#destroy", :id => "1")
    end

  end
end
