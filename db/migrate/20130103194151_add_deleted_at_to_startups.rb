class AddDeletedAtToStartups < ActiveRecord::Migration
  def change
    add_column :startups, :deleted_at, :string
  end
end
