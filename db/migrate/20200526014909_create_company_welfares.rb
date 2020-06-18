class CreateCompanyWelfares < ActiveRecord::Migration[5.1]
  def change
    create_table :company_welfares do |t|
      t.references :company, foreign_key: true
      t.references :welfare, foreign_key: true

      t.timestamps
    end
  end
end
