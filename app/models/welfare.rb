class Welfare < ApplicationRecord
    has_many :mentarity_welfares
    has_many :users, through: :mentarity_welfares
    has_many :company_welfares
    has_many :companies, through: :company_welfares
end
