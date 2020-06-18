class RemoveBasicFromGenerals < ActiveRecord::Migration[5.1]
  def change
    remove_reference :generals, :basic, foreign_key: true
  end
end
