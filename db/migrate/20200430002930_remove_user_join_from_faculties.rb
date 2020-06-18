class RemoveUserJoinFromFaculties < ActiveRecord::Migration[5.1]
  def change
    remove_reference :faculties, :user_join, foreign_key: true
  end
end
