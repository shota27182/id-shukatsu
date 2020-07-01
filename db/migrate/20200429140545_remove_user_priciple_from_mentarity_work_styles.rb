class RemoveUserPricipleFromMentarityWorkStyles < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_work_styles, :user_priciple
  end
end
