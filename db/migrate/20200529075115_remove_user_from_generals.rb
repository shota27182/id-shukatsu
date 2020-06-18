class RemoveUserFromGenerals < ActiveRecord::Migration[5.1]
  def change
    remove_reference :generals, :user, foreign_key: true
  end
end
