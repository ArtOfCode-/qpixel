class AddDefaultToIsDeleted < ActiveRecord::Migration
  def up
    change_column :answers, :is_deleted, :boolean, :default => false
    change_column :comments, :is_deleted, :boolean, :default => false
  end
  def down
    change_column :answers, :is_deleted, :boolean, :default => nil
    change_column :comments, :is_deleted, :boolean, :default => nil
  end  
end
