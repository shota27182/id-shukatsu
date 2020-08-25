class CreateCompanyCondolences < ActiveRecord::Migration[5.2]
  def change
    create_table :company_condolences do |t|
      t.references :company, foreign_key: true
      t.references :condolence, foreign_key: true

      t.timestamps
    end
  end
end
