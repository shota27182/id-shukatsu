class RemoveUserFromEducations < ActiveRecord::Migration[5.1]
  def change
    remove_reference :educations, :user, foreign_key: true
  end
end
