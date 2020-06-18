class RenameUserPricipleCompanyFeaturesToBackgroundCompanyFeatures < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_priciple_company_features, :background_company_features
  end
end
