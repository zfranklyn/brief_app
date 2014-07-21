class AddOriginallinkToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :originallink, :text
  end
end
