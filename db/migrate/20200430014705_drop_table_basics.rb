class DropTableBasics < ActiveRecord::Migration[5.1]
  def change
    drop_table :basics
  end
end
