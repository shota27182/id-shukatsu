class CreateAverageSalaries < ActiveRecord::Migration[5.2]
  def change
    create_table :average_salaries do |t|
      t.string :name

      t.timestamps
    end
  end
end
