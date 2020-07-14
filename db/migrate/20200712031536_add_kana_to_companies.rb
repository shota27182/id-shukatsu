class AddKanaToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :kana, :string
  end
end
