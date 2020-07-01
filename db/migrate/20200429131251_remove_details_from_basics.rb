class RemoveDetailsFromBasics < ActiveRecord::Migration[5.1]
  def change
    remove_column :basics, :name
    remove_column :basics, :kana
    remove_column :basics, :sex
    remove_column :basics, :birthday
    remove_column :basics, :tel
    remove_column :basics, :address1
    remove_column :basics, :address2
    remove_column :basics, :phone_number
    remove_column :basics, :building_name
  end
end
