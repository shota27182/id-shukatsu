class AddMentarityToMentarityCompanyPoints < ActiveRecord::Migration[5.1]
  def change
    add_reference :mentarity_company_points, :mentarity, foreign_key: true
  end
end