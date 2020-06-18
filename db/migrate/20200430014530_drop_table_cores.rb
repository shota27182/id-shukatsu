class DropTableCores < ActiveRecord::Migration[5.1]
  def change
    drop_table :cores
  end
end
