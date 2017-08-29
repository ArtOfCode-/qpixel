class RemoveUserIdFromPrivileges < ActiveRecord::Migration
  def change
  	remove_column :privileges, :user_id, :integer, index: true, foreign_key: true
  end
end
