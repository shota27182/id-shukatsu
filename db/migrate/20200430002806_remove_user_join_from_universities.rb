class RemoveUserJoinFromUniversities < ActiveRecord::Migration[5.1]
  def change
    remove_reference :universities, :user_join
  end
end
