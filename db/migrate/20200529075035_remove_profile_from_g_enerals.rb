class RemoveProfileFromGEnerals < ActiveRecord::Migration[5.1]
  def change
    remove_reference :generals, :profile, foreign_key: true
  end
end
