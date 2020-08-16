class CompanyScale < ApplicationRecord
    has_many :wish_company_scales
    has_many :users, through: :wish_company_scales
    has_many :company_company_scales
    has_many :companies, through: :company_company_scales
    mount_uploader :image, EventImageUploader
end
