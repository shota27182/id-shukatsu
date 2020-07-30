class AddDetailsToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :user_events, :activate, :boolean
    add_column :user_events, :activated_at, :date
    add_column :user_events, :inactivate, :boolean
    add_column :user_events, :inactivated_at, :date
  end
end
