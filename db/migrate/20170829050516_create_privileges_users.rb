class CreatePrivilegesUsers < ActiveRecord::Migration
  def change
    create_table :privileges_users, id: false do |t|
    	t.belongs_to :privilege, index: true
    	t.belongs_to :user, index: true
    end
  end
end
