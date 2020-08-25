class CreateSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :salaries do |t|
      t.references :company, foreign_key: true
      t.integer :first_salary
      t.integer :average_salary

      t.timestamps
    end
  end
end
