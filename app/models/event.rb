class Event < ApplicationRecord
    has_many :event_schedules, dependent: :destroy
    has_many :user_events, dependent: :destroy
    has_many :users, through: :user_events
    has_many :company_events, dependent: :destroy
    has_many :companies, through: :company_events
    has_many :event_profiles, dependent: :destroy
    mount_uploader :img, EventImageUploader
    
    accepts_nested_attributes_for :event_schedules
    accepts_nested_attributes_for :event_profiles
end
