class RemoveMentarityFromMentarityCompanyWelfares < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_welfares, :mentarity, foreign_key: true
  end
end
