class CompanyWorkTime < ApplicationRecord
  belongs_to :company
  belongs_to :work_time
end
