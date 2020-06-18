class CreateCompanyPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :company_points do |t|
      t.string :name

      t.timestamps
    end
  end
end
