class MentarityWelfare < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :welfare, optional: true
end
