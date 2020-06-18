class EntryController < ApplicationController
  def new
    @event_schedule = EventSchedule.find_by(id:params[:event_schedule])
    @event = Event.find_by(id:params[:event_id])
    render :layout => 'application2'
  end
  
  def complete
    render :layout => 'application2'
  end
end
