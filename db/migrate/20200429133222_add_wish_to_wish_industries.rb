class AddWishToWishIndustries < ActiveRecord::Migration[5.1]
  def change
    add_reference :wish_industries, :wish, foreign_key: true
  end
end
