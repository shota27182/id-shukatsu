class Industry < ApplicationRecord
    has_many :wish_industries
    has_many :users, through: :wish_industries
    has_many :company_industries
    has_many :companies, through: :company_industries
end
