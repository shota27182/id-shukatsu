class RemoveUserPricipleFromMentarityCompanyPoints < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_company_points, :user_priciple
  end
end
