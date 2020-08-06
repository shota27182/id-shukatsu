class EventSchedule < ApplicationRecord
    belongs_to :event
    has_many :user_events
    has_many :users, through: :user_events
    
    def create_notification
        EventSchedule.where(date: Date.today + 3).each do |i|
            entry_second_notification = User.includes(:event_schedules).where(event_schedules:{id: i.id}).includes(:user_events).where(user_events:{activate: true}).notifications.build(
                title: '「' + Event.find_by(id: event_schedule.event_id).name + '」' + '3日前です',
                content: '「' + Event.find_by(id: event_schedule.event_id).name + '」' + 'まで3日前となりました。今一度場所や持ち物のご確認をお願いいたします。' 
                )
            entry_second_notification.save
        end
        EventSchedule.where(date: Date.today + 1).each do |i|
            entry_third_notification = User.includes(:event_schedules).where(event_schedules:{id: i.id}).includes(:user_events).where(user_events:{activate: true}).notifications.build(
                title: '「' + Event.find_by(id: event_schedule.event_id).name + '」'  + '1日前です',
                content: '「' + Event.find_by(id: event_schedule.event_id).name + 'まで1日前となりました。今一度場所や持ち物のご確認をお願いいたします。'
                )
            entry_third_notification.save
        end
    end
    
end
