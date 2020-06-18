class RenameListUserPricipleCompanyScalesToWishCompanyScales < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_priciple_company_scales, :wish_company_scales
  end
end
