class RemoveUserJoinFromUniversities < ActiveRecord::Migration[5.1]
  def change
    remove_reference :universities, :user_join, foreign_key: true
  end
end
