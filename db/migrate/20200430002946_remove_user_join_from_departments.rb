class RemoveUserJoinFromDepartments < ActiveRecord::Migration[5.1]
  def change
    remove_reference :departments, :user_join, foreign_key: true
  end
end
