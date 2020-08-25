class CreateCompanyTeleworks < ActiveRecord::Migration[5.2]
  def change
    create_table :company_teleworks do |t|
      t.references :company, foreign_key: true
      t.references :telework, foreign_key: true

      t.timestamps
    end
  end
end
