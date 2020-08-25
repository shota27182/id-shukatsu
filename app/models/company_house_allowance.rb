class CompanyHouseAllowance < ApplicationRecord
  belongs_to :company
  belongs_to :house_allowance
end
