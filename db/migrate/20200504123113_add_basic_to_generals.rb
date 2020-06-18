class AddBasicToGenerals < ActiveRecord::Migration[5.1]
  def change
    add_reference :generals, :basic, foreign_key: true
  end
end
