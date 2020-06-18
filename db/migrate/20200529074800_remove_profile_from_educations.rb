class RemoveProfileFromEducations < ActiveRecord::Migration[5.1]
  def change
    remove_reference :educations, :profile, foreign_key: true
  end
end
