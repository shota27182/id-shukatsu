class AddDetailsToWishOccupations < ActiveRecord::Migration[5.1]
  def change
    add_reference :wish_occupations, :user, foreign_key: true
  end
end
