class AddUserToUserReceive < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_receives, :user, foreign_key: true
  end
end
