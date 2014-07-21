class AddRegionToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :region, :string
  end
end
