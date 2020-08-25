class CreateCompanyHealths < ActiveRecord::Migration[5.2]
  def change
    create_table :company_healths do |t|
      t.references :company, foreign_key: true
      t.references :health, foreign_key: true

      t.timestamps
    end
  end
end
