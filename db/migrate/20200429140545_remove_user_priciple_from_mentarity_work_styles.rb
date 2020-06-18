class RemoveUserPricipleFromMentarityWorkStyles < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_work_styles, :user_priciple, foreign_key: true
  end
end
