class AddUserToAnswers < ActiveRecord::Migration
  def change
  	# this is an example try to figure out in the console what does the add_reference sentence do
  	# consequently fix the error
    add_reference :answers, :user, index: true, foreign_key: true
  end
end
