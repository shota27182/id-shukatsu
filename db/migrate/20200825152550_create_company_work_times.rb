class CreateCompanyWorkTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :company_work_times do |t|
      t.references :company, foreign_key: true
      t.references :work_time, foreign_key: true

      t.timestamps
    end
  end
end
