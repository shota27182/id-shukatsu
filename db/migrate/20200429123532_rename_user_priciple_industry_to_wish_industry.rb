class RenameUserPricipleIndustryToWishIndustry < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_priciple_industries, :wish_industries
  end
end
