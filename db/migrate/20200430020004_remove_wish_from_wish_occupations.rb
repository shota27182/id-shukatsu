class RemoveWishFromWishOccupations < ActiveRecord::Migration[5.1]
  def change
    remove_reference :wish_occupations, :wish
  end
end
