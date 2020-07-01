class RemoveMentarityFromMentarityCompanyWorkStyles < ActiveRecord::Migration[5.1]
  def change
    remove_reference :mentarity_work_styles, :mentarity
  end
end
