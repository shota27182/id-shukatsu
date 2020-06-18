class AddDetailsToMentarityCompanyFeatures < ActiveRecord::Migration[5.1]
  def change
    add_reference :mentarity_company_features, :user, foreign_key: true
  end
end
