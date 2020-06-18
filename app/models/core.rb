class Core < ApplicationRecord
  belongs_to :user
  has_one :mentarity
  has_one :wish
  accepts_nested_attributes_for :mentarity
  accepts_nested_attributes_for :wish
end
