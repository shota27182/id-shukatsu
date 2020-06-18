class AddDetailsToMentarityWorkStyles < ActiveRecord::Migration[5.1]
  def change
    add_reference :mentarity_work_styles, :user, foreign_key: true
  end
end
