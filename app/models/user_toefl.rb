class UserToefl < ApplicationRecord
  belongs_to :user
  
  enum type: {IBT:0, ITP:1}
  
  self.inheritance_column = :_type_disabled
end
