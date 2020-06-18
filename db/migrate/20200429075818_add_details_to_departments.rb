class AddDetailsToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_reference :departments, :user_join, foreign_key: true
  end
end
