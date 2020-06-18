class RemoveMentarityFromMentarityCompanyFeatures < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_company_features, :mentarity, foreign_key: true
  end
end
