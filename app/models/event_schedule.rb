class EventSchedule < ApplicationRecord
    belongs_to :event
    has_many :user_events
    has_many :users, through: :user_events
    has_many :notifications, dependent: :destroy
    
    def create_notification_event_schedule!(current_user, event_schedule)
        entry_notification = current_user.notifications.build(
            event_schedule_id: event_schedule.id,
            action: 'entry_first',
            start_on: DateTime.current
            )
        entry_second_notification = current_user.notifications.build(
            event_schedule_id: event_schedule.id,
            action: 'entry_second',
            start_on: event_schedule.holding_day.to_time.to_datetime - 3
            )
        entry_third_notification = current_user.notifications.build(
            event_schedule_id: event_schedule.id,
            action: 'entry_third',
            start_on: event_schedule.holding_day.to_time.to_datetime - 1
            )
        entry_notification.save
        entry_second_notification.save
        entry_third_notification.save
        
    end
end
