class Event < ApplicationRecord
    has_many :event_schedules
    
    accepts_nested_attributes_for :event_schedules
end
