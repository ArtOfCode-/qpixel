class DropJoinTablePrivilegesUsers < ActiveRecord::Migration
	def up
		drop_table :privileges_users
	end

	def down
		create_join_table :privileges, :users do |t|
      		t.index [:privilege_id, :user_id]
      		t.index [:user_id, :privilege_id]
      	end
    end
end
