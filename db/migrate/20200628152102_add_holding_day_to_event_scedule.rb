class AddHoldingDayToEventScedule < ActiveRecord::Migration[5.2]
  def change
    add_column :event_schedules, :holding_day, :date
  end
end
