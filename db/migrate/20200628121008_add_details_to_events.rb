class AddDetailsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :introduction, :text
    add_column :events, :point, :text
    add_column :events, :flow, :text
  end
end
