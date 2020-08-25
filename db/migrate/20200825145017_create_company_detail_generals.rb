class CreateCompanyDetailGenerals < ActiveRecord::Migration[5.2]
  def change
    create_table :company_detail_generals do |t|
      t.references :company_general, foreign_key: true
      t.integer :man
      t.integer :woman

      t.timestamps
    end
  end
end
