class RenameUserPricipleWelfaresToBackgroundWelfares < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_priciple_welfares, :background_welfares
  end
end
