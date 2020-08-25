class HouseAllowance < ApplicationRecord
    has_many :company_house_allowances
    has_many :house_allowances, through: :company_house_allowances
end
