class AddDetailsToGenerals < ActiveRecord::Migration[5.1]
  def change
    add_reference :generals, :user, foreign_key: true
  end
end
