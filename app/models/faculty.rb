class Faculty < ApplicationRecord
  belongs_to :university
  has_many :departments, dependent: :destroy
  accepts_nested_attributes_for :departments
end
