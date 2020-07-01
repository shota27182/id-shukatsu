class RemoveUserJoinFromFaculties < ActiveRecord::Migration[5.1]
  def change
    remove_reference :faculties, :user_join
  end
end
