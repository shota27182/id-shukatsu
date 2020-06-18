class CreateWishWorkAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :wish_work_areas do |t|
      t.references :user, foreign_key: true
      t.references :work_area, foreign_key: true

      t.timestamps
    end
  end
end
