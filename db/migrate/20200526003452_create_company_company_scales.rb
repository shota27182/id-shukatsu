class CreateCompanyCompanyScales < ActiveRecord::Migration[5.1]
  def change
    create_table :company_company_scales do |t|
      t.references :user, foreign_key: true
      t.references :company_scale, foreign_key: true

      t.timestamps
    end
  end
end
