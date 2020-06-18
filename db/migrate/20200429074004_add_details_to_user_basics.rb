class AddDetailsToUserBasics < ActiveRecord::Migration[5.1]
  def change
    add_reference :user_basics, :user_profile, foreign_key: true
  end
end
