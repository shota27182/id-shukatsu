class CreateCompanyWorkAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :company_work_areas do |t|
      t.references :company, foreign_key: true
      t.references :work_area, foreign_key: true

      t.timestamps
    end
  end
end
