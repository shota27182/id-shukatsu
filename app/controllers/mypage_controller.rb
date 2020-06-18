class MypageController < ApplicationController
  def index
    @user = current_user
  end
  
  def profile
    @user = current_user
  end
  
  def skill
    @user = current_user
  end
  
  def receive
    @user = current_user
  end
  
  def favorite
    @user = current_user
  end
end
