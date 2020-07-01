class AddGradeToEducations < ActiveRecord::Migration[5.2]
  def change
    add_reference :educations, :grade, foreign_key: true
  end
end
