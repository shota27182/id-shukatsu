class WishOccupation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :occupation, optional: true
end
