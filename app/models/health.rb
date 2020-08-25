class Health < ApplicationRecord
    has_many :company_healthes
    has_many :companies, through: :company_healthes
end
