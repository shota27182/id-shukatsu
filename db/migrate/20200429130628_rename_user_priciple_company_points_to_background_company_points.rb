class RenameUserPricipleCompanyPointsToBackgroundCompanyPoints < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_priciple_company_points, :background_company_points
  end
end
