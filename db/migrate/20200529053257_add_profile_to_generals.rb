class AddProfileToGenerals < ActiveRecord::Migration[5.1]
  def change
    add_reference :generals, :profile, foreign_key: true
  end
end
