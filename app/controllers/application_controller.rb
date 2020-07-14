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

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    def basic_registered_user
      unless logged_in? && current_user.status == 'basic_registered'
        store_location
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
      current_user.status == 'core_registered'
    end
    
    def logged_in_company
      unless company_logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to partner_user_login_url
      end
    end
end