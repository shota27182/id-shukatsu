class WorkTime < ApplicationRecord
    has_many :company_work_times
    has_many :companies, through: :company_work_times
end
