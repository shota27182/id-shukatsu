class CreateCompanyHouseAllowances < ActiveRecord::Migration[5.2]
  def change
    create_table :company_house_allowances do |t|
      t.references :company, foreign_key: true
      t.references :house_allowance, foreign_key: true

      t.timestamps
    end
  end
end
