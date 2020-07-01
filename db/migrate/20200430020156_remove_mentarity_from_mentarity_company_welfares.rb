class RemoveMentarityFromMentarityCompanyWelfares < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_welfares, :mentarity
  end
end
