class AddPageviewToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :day_pageview, :integer, null: false, default: 0
  end
end
