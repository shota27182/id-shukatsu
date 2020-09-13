class Salary < ApplicationRecord
  belongs_to :company
  belongs_to :first_salary, optional: true
  belongs_to :average_salary, optional: true
  
end
