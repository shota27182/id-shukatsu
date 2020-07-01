class CreateEventProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :event_profiles do |t|
      t.references :event, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
