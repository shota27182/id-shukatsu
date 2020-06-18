class RemoveWishFromWishIndustries < ActiveRecord::Migration[5.1]
  def change
    remove_reference :wish_industries, :wish, foreign_key: true
  end
end
