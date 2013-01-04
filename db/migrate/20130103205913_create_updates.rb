class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.integer :startup_id
      t.text :content

      t.timestamps
    end
  end
end
