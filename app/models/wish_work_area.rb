class WishWorkArea < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :work_area, optional: true
end
