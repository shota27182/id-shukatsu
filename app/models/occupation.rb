class Occupation < ApplicationRecord
    has_many :wish_occupations
    has_many :users, through: :wish_occupations
    has_many :company_occupations
    has_many :occupations, through: :company_occupations
end
