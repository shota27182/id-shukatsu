class WorkStyle < ApplicationRecord
    has_many :mentarity_work_styles
    has_many :users, through: :mentarity_work_styles
    has_many :company_work_styles
    has_many :companies, through: :company_work_styles
    mount_uploader :image, EventImageUploader
end
