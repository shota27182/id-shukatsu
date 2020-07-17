class UserToeicsController < ApplicationController
  before_action :logged_in_user
  
  def index
  end
  
  def new
    @user_toeic = UserToeic.new
  end
  
  def create
    @user_toeic = UserToeic.new(user_toeic_params)
    @user_toeic.save
    @user_toeic = current_user.user_toeic
  end
  
  def edit
    @user_toeic = current_user.user_toeic
  end
  
  def update
    @user_toeic = current_user.user_toeic
    @user_toeic.update(user_toeic_params)
    @user_toeic = current_user.user_toeic
  end
  
  private
      
      def user_toeic_params
        params.require(:user_toeic).permit(:toeic).merge(user_id: current_user.id)
      end
end
