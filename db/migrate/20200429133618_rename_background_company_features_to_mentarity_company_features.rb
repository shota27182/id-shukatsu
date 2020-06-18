class RenameBackgroundCompanyFeaturesToMentarityCompanyFeatures < ActiveRecord::Migration[5.1]
  def change
    rename_table :background_company_features, :mentarity_company_features
  end
end
