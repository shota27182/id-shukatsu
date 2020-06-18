class RemoveMentarityFromMentarityCompanyPoints < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_company_points, :mentarity, foreign_key: true
  end
end
