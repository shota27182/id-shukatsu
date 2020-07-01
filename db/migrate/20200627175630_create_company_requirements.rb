class CreateCompanyRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :company_requirements do |t|
      t.references :company, foreign_key: true
      t.text :occupation
      t.text :work
      t.text :qualification
      t.text :holiday
      t.text :welfare

      t.timestamps
    end
  end
end
