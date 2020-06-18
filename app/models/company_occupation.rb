class CompanyOccupation < ApplicationRecord
  belongs_to :company
  belongs_to :occupation
end
