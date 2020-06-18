class WorkArea < ApplicationRecord
    has_many :wish_work_areas
    has_many :users, through: :wish_work_areas
    has_many :company_work_areas
    has_many :companies, through: :company_work_areas
end
