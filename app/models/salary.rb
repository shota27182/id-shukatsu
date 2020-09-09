class Salary < ApplicationRecord
  belongs_to :company
  belongs_to :first_salary
  belongs_to :average_salary
  
end
