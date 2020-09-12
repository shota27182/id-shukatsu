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
  
  def edit
    @event = Event.find_by(id: params[:id])
  end
  
  def update
    @event = Event.find_by(id: params[:id])
    if @event.update(event_params)
      redirect_to "/admin_page/event"
    else
      render 'edit'
    end
  end
  
  def import
    Event.import(params[:file])
    redirect_to '/admin_page/events'
  end
  
  private
      
      def event_params
        params.require(:event).permit(:id, :name, :img, :introduction, :point, :flow, event_profiles_attributes:[:id,:title, :content,:_destroy], 
                                      event_schedules_attributes:[:id,:title, :start_time, :end_time, :place, :address, :deadline, :max_people, :holding_day,:_destroy])
      end
end
