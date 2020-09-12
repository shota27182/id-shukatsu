class AdminPage::JobPrepareController < ApplicationController
  def index
  end
  
  def new
    @event = Event.new
    @event.event_schedules.build
    @event.event_profiles.build
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      @event.update(category: 5)
      redirect_to "/admin_page/job_prepare"
    else
      render 'new'
    end
  end
  
  def edit
    
  end
  
  def update
  end
  
  private
      def event_params
        params.require(:event).permit(:name, :img, :introduction, :point, :flow, event_profiles_attributes:[:id,:title, :content,:_destroy], 
                                      event_schedules_attributes:[:id,:title, :start_time, :end_time, :place, :address, :deadline, :max_people, :holding_day,:_destroy])
      end
end
