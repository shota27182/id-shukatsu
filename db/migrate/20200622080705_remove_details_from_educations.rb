class RemoveDetailsFromEducations < ActiveRecord::Migration[5.2]
  def change
    remove_reference :educations, :university, foreign_key: true
    remove_reference :educations, :faculty, foreign_key: true
    remove_reference :educations, :department, foreign_key: true
    remove_reference :educations, :basic, foreign_key: true
  end
end
