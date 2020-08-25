class CompanyGeneral < ApplicationRecord
  belongs_to :company
  has_many :company_detail_generals, dependent: :destroy
end
