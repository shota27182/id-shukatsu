class Telework < ApplicationRecord
    has_many :company_teleworks
    has_many :companies, through: :company_teleworks
end
