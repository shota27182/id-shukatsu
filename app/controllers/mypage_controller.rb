class MypageController < ApplicationController
  before_action :core_registered_user
  
  def index
    @user = User.find(current_user.id)
  end
  
  def profile
    @user = current_user
  end
  
  def edit_favorite
    @user = current_user
  end
  
  def skill
    @user = current_user
    @user_programmings = current_user.user_programmings.all
    @user_languages = current_user.user_languages.all
    @user_eiken = current_user.user_eiken
    @user_toeic = current_user.user_toeic
    @user_toefl = current_user.user_toefl
    @user_experience = current_user.user_experience
    @user_internship = current_user.user_internship
  end
  
  def receive
    @user = current_user
  end
  
  def favorite
    @user = current_user
  end
  
  def entry
    if params[:category] == "job"
      @events = current_user.events.where(events:{category: [1]})
    end
    if !params[:category]
      @events = current_user.events.where(events:{category: 2})
    end
    if params[:category] == "seminar"
      @events = current_user.events.where(events:{category: [3]})
    end
    if params[:category] == "group-seminar"
      @events = current_user.events.where(events:{category: [4]})
    end
    if params[:category] == "job-prepare"
      @events = current_user.events.where(events:{category: [5]})
    end
  end
  
  def deactivation
    @user_deactivation = UserDeactivation.new
  end
end
