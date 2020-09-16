class AddNameToEventImages < ActiveRecord::Migration[5.2]
  def change
    add_column :event_images, :name, :string
  end
end
