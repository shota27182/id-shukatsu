class WishIndustry < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :industry, optional: true
end
