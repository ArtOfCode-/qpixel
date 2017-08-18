class AddDefaultFalseValueToNotifications < ActiveRecord::Migration
  def up
    change_column :notifications, :is_read, :boolean, :default => false
  end
  def down
    change_column :notifications, :is_read, :boolean, :default => nil
  end  
end
