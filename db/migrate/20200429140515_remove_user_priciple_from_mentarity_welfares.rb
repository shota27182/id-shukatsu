class RemoveUserPricipleFromMentarityWelfares < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_welfares, :user_priciple
  end
end
