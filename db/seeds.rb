# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

default_settings = [
  [ 'SiteName', 'QPixel' ],
  [ 'SiteLogoPath', '/assets/logo.png' ],
  [ 'QuestionUpVoteRep', '5' ],
  [ 'QuestionDownVoteRep', '-2' ],
  [ 'AnswerUpVoteRep', '10' ],
  [ 'AnswerDownVoteRep', '-2' ],
  [ 'AllowSelfVotes', 'false' ],
  [ 'AskingGuidance', '<p>Questions get better answers if they...</p><ul><li>are specific</li><li>are not mostly '\
                      'or entirely based on opinions</li><li>are well written</li></ul>' ],
  [ 'AnsweringGuidance', '<p>When answering, remember to...</p><ul><li><strong>answer the question</strong> - posts '\
                         'that don\'t address the problem clutter up the thread</li><li><strong>explain why you\'re '\
                         'right</strong> - not everyone knows what you do, so explain why this is the answer</li></ul>' ],
  [ 'AdministratorContactEmail', 'contact@example.com' ],
  [ 'HotQuestionsCount', 5 ],
  [ 'RepNotificationsActive', 'true' ],
  [ 'AdminBadgeCharacter', ''],
  [ 'ModBadgeCharacter', ''],
  [ 'IRCHostname', 'localhost'],
  [ 'IRCPort', '6667'],
  [ 'IRCServerID', '8AB'],
  [ 'IRCServerName', 'qpixel.qpixel'],
  [ 'IRCPass', 'asdf'],
  [ 'BlockedIpAddresses', '' ],
  [ 'RestrictDBIntensiveOps', 'true' ],
  [ 'SoftDeleteTransferUser', '0' ]
]

default_privileges = [
  [ 'Close', 250 ],
  [ 'Edit', 500 ],
  [ 'Delete', 1000 ],
  [ 'ViewDeleted', 1000 ]
]

default_post_history_types = [
  [ 'Edit', 'A post was updated from an older revision to a newer one.', 'edited' ],
  [ 'Delete', 'A post\'s state was changed from normal to being deleted.', 'deleted' ],
  [ 'Undelete', 'A post\'s state was changed from being deleted back to normal.', 'undeleted' ],
  [ 'Close', 'A post was set to prevent new answers.', 'closed' ],
  [ 'Reopen', 'A post was set to allow new answers.', 'reopened' ]
]

default_settings.each do |name, value|
  SiteSetting.create(name: name, value: value)
end

default_privileges.each do |name, threshold|
  Privilege.create(name: name, threshold: threshold)
end

default_post_history_types.each do |name, description, action_name|
  PostHistoryType.create(name: name, description: description, action_name: action_name)
end

question_titles = [ 'Ruby on Rails files in asset pipeline not working', 'Ruby on Rails jquery files are not loaded', 'Jquery-ui Effect not working with ROR', 'strong_params not working', 'GEM Devise facebook-omniauth not working', 'image not loading', 'Carrierwave FOG now uploading images' ]
question_text = 'Some random text for a question asked from one of our users, should be answered by somebody else or from a mentor'

6.times do 
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, reputation: Faker::Number.number(2), password: Faker::Internet.password(10))
end

question_titles.each do |title|
  Question.create(title: title, body: question_text, tags: ['ruby-on-rails'], score: Faker::Number.number(3), user_id: User.order("RANDOM()").first.id )
end