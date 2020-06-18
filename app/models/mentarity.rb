class Mentarity < ApplicationRecord
  belongs_to :core
  has_many :mentarity_company_features
  has_many :company_features, through: :mentarity_company_features
  has_many :mentarity_company_points
  has_many :company_points, through: :mentarity_company_points
  has_many :mentarity_welfares
  has_many :welfares, through: :mentarity_welfares
  has_many :mentarity_work_styles
  has_many :work_styles, through: :mentarity_work_styles
  accepts_nested_attributes_for :mentarity_company_features
  accepts_nested_attributes_for :mentarity_company_points
  accepts_nested_attributes_for :mentarity_welfares
  accepts_nested_attributes_for :mentarity_work_styles
end
