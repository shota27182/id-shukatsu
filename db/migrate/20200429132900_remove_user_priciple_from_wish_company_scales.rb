class RemoveUserPricipleFromWishCompanyScales < ActiveRecord::Migration[5.1]
  def change
    remove_reference :wish_company_scales, :user_priciple
  end
end
