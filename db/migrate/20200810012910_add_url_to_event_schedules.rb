class AddUrlToEventSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :event_schedules, :url, :string
  end
end
