class RemoveUserPricipleFromWishIndustries < ActiveRecord::Migration[5.1]
  def change
    remove_reference :wish_industries, :user_priciple
  end
end
