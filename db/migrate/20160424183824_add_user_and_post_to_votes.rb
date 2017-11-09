class AddUserAndPostToVotes < ActiveRecord::Migration
  def change
    add_reference :votes, :user, index: true, foreign_key: true
    # this migration does not work
    # add_reference :votes, :post, index: true, foreign_key: true
  end
end
