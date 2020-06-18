class CreateCompanyProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :company_profiles do |t|
      t.references :company, foreign_key: true
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
