class Holiday < ApplicationRecord
    has_many :company_holidays
    has_many :companies, through: :company_holidays
end
