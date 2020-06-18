class AddMentarityToMentarityWorkStyles < ActiveRecord::Migration[5.1]
  def change
    add_reference :mentarity_work_styles, :mentarity, foreign_key: true
  end
end
