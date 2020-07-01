class CreateProgrammings < ActiveRecord::Migration[5.2]
  def change
    create_table :programmings do |t|
      t.string :name

      t.timestamps
    end
  end
end
