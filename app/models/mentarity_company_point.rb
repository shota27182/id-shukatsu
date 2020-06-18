class MentarityCompanyPoint < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company_point, optional: true
end
