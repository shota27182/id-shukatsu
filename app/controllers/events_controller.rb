class EventsController < ApplicationController
  def index
    @industries = Industry.all
    @WorkAreas = WorkArea.all
    
    if params[:industry]
      @IndustriesSearch = params[:industry].split(",").map(&:to_i)
    end
    if params[:area]
      @AreasSearch = params[:area].split(",").map(&:to_i)
    end
    
  end

  def show
    @event = Event.find(params[:id])
    @event_schedule = @event.event_schedules.all
    render :layout => 'application3'
  end
  
  def entry
  end
end
