class RemoveUserPricipleFromMentarityCompanyFeatures < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_company_features, :user_priciple
  end
end
