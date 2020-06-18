class RemoveWishFromWishOccupations < ActiveRecord::Migration[5.1]
  def change
    remove_reference :wish_occupations, :wish, foreign_key: true
  end
end
