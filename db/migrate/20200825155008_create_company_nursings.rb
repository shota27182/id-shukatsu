class CreateCompanyNursings < ActiveRecord::Migration[5.2]
  def change
    create_table :company_nursings do |t|
      t.references :company, foreign_key: true
      t.references :nursing, foreign_key: true

      t.timestamps
    end
  end
end
