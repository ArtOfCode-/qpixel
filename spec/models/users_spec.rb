require 'rails_helper'

RSpec.describe Users, type: :model do
	let(:user) { FactoryGirl.create(:user)}
	let(:content) { content = 'a test notification' }
	let(:link) { link = 'https//idontknow/howthis/works.com' }

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
		let(:user_with_privileges) { FactoryGirl.create(:user_with_privileges) }
		let(:question) { FactoryGirl.create(:question) }

		it 'returns true if the user owns the post' do
			expect(user.has_post_privilege?('Edit', user.questions.first)).to be(true)
		end

		it 'returns true if the user has the privilege' do
			expect(user_with_privileges.has_post_privilege?('create', question)).to be(true)
		end

		it 'return false if the user either do not own the post of have the privilege' do
			expect(user.has_post_privilege?('Delete', question)).to be(false)
		end
	end

	describe 'create_notification(content, link)' do
		it 'creates a new notification' do
			expect { user.create_notification(content, link) }.to change { Notification.count }.by(1)
		end
		it 'saves the notification in the array notifications' do 
			expect(user.create_notification(content, link).size).to be(1)
		end
	end

	describe 'unread_notifications' do

		before(:each) do
			3.times do
				user.create_notification(content, link)
			end
		end

		it 'returns the unread notifications' do
			expect(user.unread_notifications).to be(3)
		end

		it 'returns the correct number of unread notifications' do
			# binding.pry
			notifications = user.notifications.where(:is_read => false).limit(2)
			notifications.each do |notification|
				notification.is_read = true
				notification.save
			end
			expect(user.unread_notifications).to be(1)
		end
	end
end
