class ApplicationController < ActionController::Base
  before_action :set_search
  protect_from_forgery with: :exception
  include SessionsHelper
  include PartnerUser::SessionsHelper

  def hello
    render html: 'hello, world!'
  end
  
  def set_search
    @companies_search = SearchForm.new
  end

  private
  
    def active_user
      if logged_in? && current_user.status == 'core_registered'
        store_location
        redirect_back_or '/mypage'
      end
    end

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    def basic_registered_user
      unless logged_in? && current_user.status == 'basic_registered' 
        flash[:danger] = "Please log in."
        redirect_to '/users/basics'
      end
    end
    
    def core_registered_user
      unless logged_in? && current_user.status == 'core_registered'
        store_location
        flash[:danger] = "Please log in."
        redirect_to '/users/cores'
      end
    end
    
    def core_registered?
      !current_user.nil? && current_user.status == 'core_registered'
    end
    
    def core_registered?
      current_user.status == 'core_registered'
    end
    
    def logged_in_company
      unless company_logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to partner_user_login_url
      end
    end
    
    def event_applied_user
      if current_user.events.where(events:{id: params[:event_id]}).includes(:user_events).where(user_events:{activate: true}).present?
         store_location
         redirect_to '/events'
      end
    end
end