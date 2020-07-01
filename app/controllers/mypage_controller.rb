class MypageController < ApplicationController
  before_action :logged_in_user
  
  def index
    @user = current_user
  end
  
  def profile
    @user = current_user
  end
  
  def skill
    @user = current_user
    @user_programmings = current_user.user_programmings.all
    @user_languages = current_user.user_languages.all
    @user_eiken = current_user.user_eiken
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
end
