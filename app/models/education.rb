class Education < ApplicationRecord
  belongs_to :user
  belongs_to :grade, optional: true
  
end
