class PartnerPage::EntryController < ApplicationController
  layout 'application4.html.erb'
  def new
    @event = current_company.events.build
    @event.event_schedules.build
    @event.event_profiles.build
  end
  
  def create
    @event = current_company.events.build(event_params)
    if @event.save
      CompanyEvent.create(company_id: current_company.id,event_id: @event.id)
      @event.update(category: 1)
      redirect_to "/partner_page/event"
    else
      render 'new'
    end
  end
  
  private
      
      def event_params
        params.require(:event).permit(:name, :img, :introduction, :point, :flow, event_profiles_attributes:[:id,:title, :content,:_destroy], 
                                      event_schedules_attributes:[:id,:title, :start_time, :end_time, :place, :address, :deadline, :max_people, :holding_day,:_destroy])
      end
end
