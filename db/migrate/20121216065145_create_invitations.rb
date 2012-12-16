class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :user_id
      t.integer :startup_id

      t.timestamps
    end
    add_index :invitations, :user_id
    add_index :invitations, :startup_id
    add_index :invitations, [:user_id, :startup_id], unique: true
  end
end
