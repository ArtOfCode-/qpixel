require 'rails_helper'

RSpec.describe Users, type: :model do

	describe '#has_privilege?(name)' do 
		let(:user) { FactoryGirl.create(:user_with_privileges) }

		it 'does not have the privilege' do
			expect(user.has_privilege?('edit')).to be(false)
		end
		it 'does have the privilege' do
			expect(user.has_privilege?('create')).to be(true)
		end
	end

	describe '#has_post_privilege?(name, post)' do 
		let(:user) { FactoryGirl.create(:user_with_questions) }
		
		it 'returns true if the user owns the post' do
			expect(user.has_post_privilege?('Edit', user.questions.first)).to be(true)
		end

		it 'returns '

	end
end
