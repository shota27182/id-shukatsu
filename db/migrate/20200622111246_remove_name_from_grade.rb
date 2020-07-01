class RemoveNameFromGrade < ActiveRecord::Migration[5.2]
  def change
    remove_reference :grades, :name, foreign_key: true
  end
end
