class RenamePriciplesToCores < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_priciples, :cores
  end
end
