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
  end
end
