class AddWebsiteToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :website, :string
  end
end
