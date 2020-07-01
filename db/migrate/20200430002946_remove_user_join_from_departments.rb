class RemoveUserJoinFromDepartments < ActiveRecord::Migration[5.1]
  def change
    remove_reference :departments, :user_join
  end
end
