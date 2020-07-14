class EventsController < ApplicationController
  def index
    if logged_in?
      @user = User.find(current_user.id)
    end
    @industries = Industry.all
    @WorkAreas = WorkArea.all
    @WorkStyles = WorkStyle.all
    @welfares = Welfare.all
    @features = CompanyFeature.all
    @points = CompanyPoint.all
    
    
    if params[:category] && params[:industry] && params[:area] && params[:work_style] && params[:welfare] &&  params[:feature] && params[:point]
      @CategoriesSearch = params[:category].split(",").map(&:to_i)
      if @CategoriesSearch.empty?
        @get_events = Event.all
      else
        @get_events = Event.where(category: params[:category].split(",").map(&:to_i))
      end
      @IndustriesSearch = params[:industry].split(",").map(&:to_i)
      if @IndustriesSearch.empty?
        @get_events = @get_events.all
      else
        @get_events = @get_events.includes(:company => :industries).where(industries: {id: params[:industry].split(",").map(&:to_i)})
      end
      @AreasSearch = params[:area].split(",").map(&:to_i)
      if @AreasSearch.empty?
        @get_events = @get_events
      else
        @get_events = @get_events.includes(:company => :work_areas).where(work_areas: {id: params[:area].split(",").map(&:to_i)})
      end
      @WorkStylesSearch = params[:work_style].split(",").map(&:to_i)
      if @WorkStylesSearch.empty?
        @get_events = @get_events
      else
        @get_events = @get_events.includes(:company => :work_styles).where(work_styles: {id: params[:work_style].split(",").map(&:to_i)})
      end
      @WelfaresSearch = params[:welfare].split(",").map(&:to_i)
      if @WelfaresSearch.empty?
        @get_events = @get_events
      else
        @get_events = @get_events.includes(:company => :welfares).where(welfares: {id: params[:welfare].split(",").map(&:to_i)})
      end
      @FeaturesSearch = params[:feature].split(",").map(&:to_i)
      if @FeaturesSearch.empty?
        @get_events = @get_events
      else
        @get_events = @get_events.includes(:company => :company_features).where(company_features: {id: params[:feature].split(",").map(&:to_i)})
      end
      @PointsSearch = params[:point].split(",").map(&:to_i)
      if @PointsSearch.empty?
        @get_events = @get_events.page(params[:page]).per(4)
      else
        @get_events = @get_events.includes(:company => :company_points).where(company_points: {id: params[:point].split(",").map(&:to_i)}).page(params[:page]).per(4)
      end
    end
    
    
  end

  def show
    @event = Event.find(params[:id])
    @event_schedule = @event.event_schedules.all
    @company =  Company.joins(:events).find_by(events:{id:@event.id})
    render :layout => 'application3'
    
    if logged_in?
      @event_history = current_user.event_histories.build(event_id: @event.id)
      @event_history.save
      histories_stock_limit = 10
      histories = current_user.event_histories.all
      if histories.count > histories_stock_limit
        histories[0].destroy
      end
    end
  end
  
  def entry
  end
end
