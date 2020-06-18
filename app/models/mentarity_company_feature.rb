class MentarityCompanyFeature < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company_feature, optional: true
end
