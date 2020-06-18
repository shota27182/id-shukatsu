class RemoveDetailsFromEducations < ActiveRecord::Migration[5.1]
  def up
    remove_column :educations, :user
    remove_column :educations, :profile
  end

  def down
    add_column :educations, :user, :references
    add_column :educations, :profile, :references
  end
end
