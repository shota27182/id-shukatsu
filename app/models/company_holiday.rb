class CompanyHoliday < ApplicationRecord
  belongs_to :company
  belongs_to :holiday
end
