class MentarityWorkStyle < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :work_style, optional: true
end
