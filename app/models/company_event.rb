class CompanyEvent < ApplicationRecord
  belongs_to :company
  belongs_to :event
end
