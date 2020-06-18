class CreateCompanyScales < ActiveRecord::Migration[5.1]
  def change
    create_table :company_scales do |t|
      t.string :name

      t.timestamps
    end
  end
end
