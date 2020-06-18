class CreateCompanyCompanyFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :company_company_features do |t|
      t.references :company, foreign_key: true
      t.references :company_feature, foreign_key: true

      t.timestamps
    end
  end
end
