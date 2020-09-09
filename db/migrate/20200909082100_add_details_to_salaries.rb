class AddDetailsToSalaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :salaries, :first_salary, foreign_key: true
    add_reference :salaries, :average_salary, foreign_key: true
  end
end
