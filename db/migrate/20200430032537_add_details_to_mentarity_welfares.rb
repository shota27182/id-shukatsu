class AddDetailsToMentarityWelfares < ActiveRecord::Migration[5.1]
  def change
    add_reference :mentarity_welfares, :user, foreign_key: true
  end
end
