class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :public_email, :string
    add_column :users, :organization, :string
    add_column :users, :website, :string
    add_column :users, :bio, :text
  end
end
