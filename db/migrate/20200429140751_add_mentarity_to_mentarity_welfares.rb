class AddMentarityToMentarityWelfares < ActiveRecord::Migration[5.1]
  def change
    add_reference :mentarity_welfares, :mentarity, foreign_key: true
  end
end
