class Basic < ApplicationRecord
  belongs_to :user
  has_one :education
  has_one :general, optional: true
  
  accepts_nested_attributes_for :education
  accepts_nested_attributes_for :general
end
