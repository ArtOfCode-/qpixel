require 'rails_helper'

RSpec.describe Answer, type: :model do

	let(:answer) { FactoryGirl.create(:answer)}
	let(:invalid_answer) { FactoryGirl.build(:answer, body: 'is too short!        ') }

	describe 'stripped minimum method' do
		it 'answer with short body are not valid' do
			expect(invalid_answer).to_not be_valid
		end

		it 'triggers an error if the body is less 30 non whitespaces characters' do
			invalid_answer.valid?
			expect(invalid_answer.errors[:body][1]).to eq("must be more than 30 non-whitespace characters long")
		end
	end

end