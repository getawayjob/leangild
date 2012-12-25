class AddTaglineToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :tagline, :string
  end
end
