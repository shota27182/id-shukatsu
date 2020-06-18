class CompanyScale < ApplicationRecord
    has_many :wish_company_scales
    has_many :users, through: :wish_company_scales
end
