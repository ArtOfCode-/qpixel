require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
	describe 'GET #new' do
		it 'returns a success response' do 
			get :new
			expect(response).to be_success
		end
	end

	describe 'POST #create' do
		it ''
end
