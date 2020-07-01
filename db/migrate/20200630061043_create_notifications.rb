class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :event_schedule, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :checked, default: false, null: false
      t.date :start_on
      t.string :action

      t.timestamps
    end
  end
end
