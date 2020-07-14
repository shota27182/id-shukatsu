class PartnerPage::EventController < ApplicationController
  before_action :logged_in_company
  layout 'application4.html.erb'
  def index
  end
  
  def edit
    @event = current_company.events.find_by(id: params[:id])
  end
  
  def update
    if @event = current_company.events.update!(event_params)
      redirect_to "/partner_page/event"
    else
      render 'edit'
    end
  end
  
  private
      def event_params
        params.require(:event).permit(:id, :name, :img, :introduction, :point, :flow, event_profiles_attributes:[:id,:title, :content,:_destroy], 
                                      event_schedules_attributes:[:id,:title, :start_time, :end_time, :place, :address, :deadline, :max_people, :holding_day,:_destroy])
      end
      
end
