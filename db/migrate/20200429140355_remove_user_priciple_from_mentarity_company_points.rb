class RemoveUserPricipleFromMentarityCompanyPoints < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_company_points, :user_priciple, foreign_key: true
  end
end
