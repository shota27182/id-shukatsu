class IndexController < ApplicationController
  def home
    if logged_in?
      
    end
    @recently_visit = cookies[:event_id].split(',') if cookies[:event_id]
  end
  
  
  def about
  end
end
