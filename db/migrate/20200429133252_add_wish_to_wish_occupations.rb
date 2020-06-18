class AddWishToWishOccupations < ActiveRecord::Migration[5.1]
  def change
    add_reference :wish_occupations, :wish, foreign_key: true
  end
end
