class RenameBackgroundCompanyPointsToMentarityCompanyPoints < ActiveRecord::Migration[5.1]
  def change
    rename_table :background_company_points, :mentarity_company_points
  end
end
