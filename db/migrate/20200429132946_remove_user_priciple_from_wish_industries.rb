class RemoveUserPricipleFromWishIndustries < ActiveRecord::Migration[5.1]
  def change
    remove_reference :wish_industries, :user_priciple, foreign_key: true
  end
end
