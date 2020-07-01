class EventsController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @industries = Industry.all
    @WorkAreas = WorkArea.all
    
    if params[:industry]
      @IndustriesSearch = params[:industry].split(",").map(&:to_i)
      if @IndustriesSearch.empty?
        @get_events = Event.all
      else
        @get_events = Event.includes(:companies => :industries).where(industries: {id: params[:industry].split(",").map(&:to_i)})
      end
    end
    if params[:area]
      @AreasSearch = params[:area].split(",").map(&:to_i)
      if @AreasSearch.empty?
        @get_events = @get_events
      else
        @get_events = @get_events.includes(:companies => :work_areas).where(work_areas: {id: params[:area].split(",").map(&:to_i)})
      end
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
