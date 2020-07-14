class EventSchedule < ApplicationRecord
    belongs_to :event
    has_many :user_events
    has_many :users, through: :user_events
    
    
    
end
