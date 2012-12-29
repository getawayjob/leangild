class RemoveDetailsFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :username
  	remove_column :users, :first_name
  	remove_column :users, :last_name
  	remove_column :users, :fullname
  end

  def down
  end
end
