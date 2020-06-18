class Wish < ApplicationRecord
  belongs_to :core
  has_many :wish_company_scales
  has_many :company_scales, through: :wish_company_scales
  has_many :wish_industries
  has_many :industries, through: :wish_industries
  has_many :wish_occupations
  has_many :occupations, through: :wish_occupations
  has_many :wish_work_areas
  has_many :work_areas, through: :wish_work_areas
  accepts_nested_attributes_for :wish_company_scales
  accepts_nested_attributes_for :wish_industries
  accepts_nested_attributes_for :wish_occupations
  accepts_nested_attributes_for :wish_work_areas
end
