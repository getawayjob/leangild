class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.integer :user_id
      t.text :pitch
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
