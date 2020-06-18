class CompanyFeature < ApplicationRecord
    has_many :mentarity_company_features
    has_many :users, through: :mentarity_company_features
    has_many :company_company_features
    has_many :companies, through: :company_company_features
end
