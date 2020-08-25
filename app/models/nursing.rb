class Nursing < ApplicationRecord
    has_many :company_nursings
    has_many :companies, through: :company_nursings
end
