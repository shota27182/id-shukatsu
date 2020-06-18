class AddDetailsToFaculties < ActiveRecord::Migration[5.1]
  def change
    add_reference :faculties, :user_join, foreign_key: true
  end
end
