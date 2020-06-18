class RenameBackgroundWorkStylesToMentarityWorkStyles < ActiveRecord::Migration[5.1]
  def change
    rename_table :background_work_styles, :mentarity_work_styles
  end
end
