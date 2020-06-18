class RenameUserPricipleOccupationToWishOccupation < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_priciple_occupations, :wish_occupations
  end
end
