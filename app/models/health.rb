class Health < ApplicationRecord
    has_many :company_healths
    has_many :companies, through: :company_healths
end
