class RemoveFirstSalaryFromSararies < ActiveRecord::Migration[5.2]
  def change
    remove_column :salaries, :first_salary, :integer
    remove_column :salaries, :average_salary, :integer
  end
end
