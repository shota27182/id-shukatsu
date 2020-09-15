class CreateEventImages < ActiveRecord::Migration[5.2]
  def change
    create_table :event_images do |t|
      t.references :event, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
