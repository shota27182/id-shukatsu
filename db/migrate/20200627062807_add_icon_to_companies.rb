class AddIconToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :icon, :string
  end
end
