class CompanyPoint < ApplicationRecord
    has_many :mentarity_company_points
    has_many :users, through: :mentarity_company_points
    has_many :company_company_points
    has_many :companies, through: :company_company_points
end
