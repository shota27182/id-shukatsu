class RenameUserPricipleWorkStyleToBackgroundWorkStyle < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_priciple_work_styles, :background_work_styles
  end
end
