class CreateWorkAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :work_areas do |t|
      t.string :name
      t.timestamps
    end
  end
end
