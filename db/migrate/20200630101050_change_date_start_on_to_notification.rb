class ChangeDateStartOnToNotification < ActiveRecord::Migration[5.2]
  def change
    change_column :notifications, :start_on, :datetime
  end
end
