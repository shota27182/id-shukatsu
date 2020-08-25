class Condolence < ApplicationRecord
    has_many :company_condolences
    has_many :companies, through: :company_condolences
end
