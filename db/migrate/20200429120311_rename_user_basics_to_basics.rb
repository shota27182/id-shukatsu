class RenameUserBasicsToBasics < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_basics, :basics
  end
end
