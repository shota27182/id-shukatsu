class RemoveDetailsFromGenerals < ActiveRecord::Migration[5.1]
  def up
    remove_column :generals, :profile
  end

  def down
    add_column :generals, :profile, :references
  end
end
