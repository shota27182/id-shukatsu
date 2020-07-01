class RemoveGradeFromEducations < ActiveRecord::Migration[5.2]
  def change
    remove_column :educations, :grade, :string
  end
end
