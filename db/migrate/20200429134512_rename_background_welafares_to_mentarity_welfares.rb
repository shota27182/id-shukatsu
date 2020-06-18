class RenameBackgroundWelafaresToMentarityWelfares < ActiveRecord::Migration[5.1]
  def change
    rename_table :background_welfares, :mentarity_welfares
  end
end
