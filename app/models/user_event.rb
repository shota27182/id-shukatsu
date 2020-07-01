class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :event_schedule
end
