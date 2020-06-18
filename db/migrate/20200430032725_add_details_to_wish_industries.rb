class AddDetailsToWishIndustries < ActiveRecord::Migration[5.1]
  def change
    add_reference :wish_industries, :user, foreign_key: true
  end
end
