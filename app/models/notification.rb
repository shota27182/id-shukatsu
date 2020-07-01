class Notification < ApplicationRecord
  belongs_to :event_schedule
  belongs_to :user
end
