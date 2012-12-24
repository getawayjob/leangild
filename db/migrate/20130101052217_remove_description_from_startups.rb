class RemoveDescriptionFromStartups < ActiveRecord::Migration
  def up
    remove_column :startups, :description
  end
end
