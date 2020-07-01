class EntryController < ApplicationController
  before_action :logged_in_user
  
  def new
    @event_schedule = EventSchedule.find_by(id:params[:event_schedule])
    @event = Event.find_by(id:params[:event_id])
    render :layout => 'application2'
  end
  
  def create
    @user_event = UserEvent.new(user_id:current_user.id, event_id:params[:event_id],event_schedule_id:params[:event_schedule])
    if @user_event.save!
      @event_schedule = EventSchedule.find_by(id:params[:event_schedule])
      @event_schedule.create_notification_event_schedule!(current_user, @event_schedule)
      redirect_to event_entry_complete_path
    end
  end
  
  def complete
    render :layout => 'application2'
  end
  
  
  
end
