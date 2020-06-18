class AddWishToWishCompanyScales < ActiveRecord::Migration[5.1]
  def change
    add_reference :wish_company_scales, :wish, foreign_key: true
  end
end
