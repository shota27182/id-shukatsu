class CreateEventSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :event_schedules do |t|
      t.string :title
      t.time :start_time
      t.time :end_time
      t.string :place
      t.string :address
      t.date :deadline
      t.integer :max_people
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
