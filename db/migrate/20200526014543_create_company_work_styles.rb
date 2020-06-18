class CreateCompanyWorkStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :company_work_styles do |t|
      t.references :company, foreign_key: true
      t.references :work_style, foreign_key: true

      t.timestamps
    end
  end
end
