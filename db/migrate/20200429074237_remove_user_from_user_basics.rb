class RemoveUserFromUserBasics < ActiveRecord::Migration[5.1]
  def change
    remove_reference :user_basics, :user, foreign_key: true
  end
end
