class CreateCompanyHolidays < ActiveRecord::Migration[5.2]
  def change
    create_table :company_holidays do |t|
      t.references :company, foreign_key: true
      t.references :holiday, foreign_key: true

      t.timestamps
    end
  end
end
