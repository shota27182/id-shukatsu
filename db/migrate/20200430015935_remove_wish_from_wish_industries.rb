class RemoveWishFromWishIndustries < ActiveRecord::Migration[5.1]
  def change
    remove_reference :wish_industries, :wish
  end
end
