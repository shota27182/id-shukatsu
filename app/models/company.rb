class Company < ApplicationRecord
    has_one :company_profiles
    has_many :company_company_features
    has_many :company_features, through: :company_company_features
    has_many :company_industries
    has_many :industries, through: :company_industries
    has_many :company_occupations
    has_many :occupations, through: :company_occupations
    has_many :company_work_areas
    has_many :work_areas, through: :company_work_areas
    has_many :company_work_styles
    has_many :work_styles, through: :company_work_styles
    has_many :company_welfares
    has_many :welfares, through: :company_welfares
    has_many :company_company_points
    has_many :company_points, through: :company_company_points
    
    accepts_nested_attributes_for :company_profiles
    accepts_nested_attributes_for :company_company_features
    accepts_nested_attributes_for :company_industries
    accepts_nested_attributes_for :company_occupations
    accepts_nested_attributes_for :company_work_areas
    accepts_nested_attributes_for :company_work_styles
    accepts_nested_attributes_for :company_welfares
    accepts_nested_attributes_for :company_company_points
end
