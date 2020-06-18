class RemoveUserProfileFromBasics < ActiveRecord::Migration[5.1]
  def change
    remove_reference :basics, :user_profile, foreign_key: true
  end
end
