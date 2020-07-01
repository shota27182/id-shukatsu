class AddNameToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :name, :string
  end
end
