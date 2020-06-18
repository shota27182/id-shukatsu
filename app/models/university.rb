class University < ApplicationRecord
    has_many :faculties, dependent: :destroy
    accepts_nested_attributes_for :faculties
end
