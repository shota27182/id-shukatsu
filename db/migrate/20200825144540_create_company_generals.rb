class CreateCompanyGenerals < ActiveRecord::Migration[5.2]
  def change
    create_table :company_generals do |t|
      t.references :company, foreign_key: true
      t.integer :man
      t.integer :woman
      t.integer :humanity_man
      t.integer :humanity_woman
      t.integer :science_man
      t.integer :science_woman
      t.integer :work_duration
      t.integer :overtime
      t.integer :holiday_use

      t.timestamps
    end
  end
end
