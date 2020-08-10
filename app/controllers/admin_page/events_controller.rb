class AdminPage::EventsController < ApplicationController
  layout 'application4'
  
  def index
  end

  def new
    @event = Event.new
    @event.event_schedules.build
  end
  
  def create
  end
  
  def import
    Event.import(params[:file])
    redirect_to '/admin_page/events'
  end
end
