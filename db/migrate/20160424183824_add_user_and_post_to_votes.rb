class AddUserAndPostToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :user, index: true, foreign_key: true
    # this migration does not work
    # check add_user_to_answer row 3
    #add_reference :votes, :post, index: true, foreign_key: true
  end
end
