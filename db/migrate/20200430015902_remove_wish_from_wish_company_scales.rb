class RemoveWishFromWishCompanyScales < ActiveRecord::Migration[5.1]
  def change
    remove_reference :wish_company_scales, :wish, foreign_key: true
  end
end
