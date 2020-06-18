class WishCompanyScale < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company_scale, optional: true
end
