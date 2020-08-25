class EntryController < ApplicationController
  before_action :logged_in_user
  before_action :event_applied_user, only:[:new, :create]
  
  def new
    @event_schedule = EventSchedule.find_by(id:params[:event_schedule])
    @event = Event.find_by(id:params[:event_id])
    render :layout => 'application2'
  end
  
  def create
    @user_event = UserEvent.new(user_id:current_user.id, event_id:params[:event_id],event_schedule_id:params[:event_schedule], activate: true, activated_at: Date.current)
    if @user_event.save!
      @event_schedule = EventSchedule.find_by(id: params[:event_schedule])
      current_user.create_notification_event_schedule!(current_user, @event_schedule)
      redirect_to event_entry_complete_path
    end
  end
  
  def complete
    @company = Company.includes(:events).find_by(events:{id: params[:event_id]}) 
    render :layout => 'application2'
  end
  
  def edit_schedule
    @event = Event.find_by(id: params[:event_id])
    render :layout => 'application2'
    @user_event = UserEvent.new
  end
  
  def edit_complete
    @event = Event.find(params[:event_id])
    @user_event = UserEvent.find_by(user_id:current_user.id, event_id:params[:event_id])
    @user_event.destroy
    @user_event = UserEvent.new(user_id:current_user.id, event_id:params[:event_id],event_schedule_id:params[:event_schedule_id])
    if @user_event.save!
      @event_schedule = EventSchedule.find_by(id: params[:event_schedule_id])
      current_user.change_notification_event_schedule!(current_user, @event_schedule)
      redirect_to event_entry_complete_path
    end
  end
  
  def cancel
    @event = Event.find_by(id: params[:event_id])
    render :layout => 'application2'
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    @user_event = UserEvent.find_by(user_id:current_user.id, event_id:params[:event_id])
    @user_event.update(activate: false, inactivate: true, inactivated_at: Date.current)
    redirect_to event_entry_complete_cancel_path
  end
  
  def complete_cancel
  end
  
end
