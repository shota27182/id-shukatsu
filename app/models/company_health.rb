class CompanyHealth < ApplicationRecord
  belongs_to :company
  belongs_to :health
end
