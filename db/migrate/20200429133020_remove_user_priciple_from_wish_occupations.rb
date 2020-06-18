class RemoveUserPricipleFromWishOccupations < ActiveRecord::Migration[5.1]
  def change
    remove_reference :wish_occupations, :user_priciple, foreign_key: true
  end
end
