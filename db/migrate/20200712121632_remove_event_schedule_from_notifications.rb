class RemoveEventScheduleFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_reference :notifications, :event_schedule, foreign_key: true
  end
end
