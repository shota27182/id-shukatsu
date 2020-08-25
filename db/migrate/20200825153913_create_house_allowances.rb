class CreateHouseAllowances < ActiveRecord::Migration[5.2]
  def change
    create_table :house_allowances do |t|
      t.string :name

      t.timestamps
    end
  end
end
