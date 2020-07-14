class RemoveEventFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_reference :notifications, :event, foreign_key: true
  end
end
