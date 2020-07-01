class Programming < ApplicationRecord
    has_many :user_programmings
    has_many :users, through: :user_programmings
end
