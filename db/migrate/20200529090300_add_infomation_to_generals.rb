class AddInfomationToGenerals < ActiveRecord::Migration[5.1]
  def change
    add_column :generals, :address1, :string
    add_column :generals, :address2, :string
    add_column :generals, :tel, :string
    add_column :generals, :building_name, :string
  end
end
