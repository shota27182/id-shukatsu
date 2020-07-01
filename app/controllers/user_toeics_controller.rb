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
  end
  
  def edit
    @user_toeic = UserToeic.find_by(id: params[:id])
  end
  
  def update
    @user_eiken = UserEiken.update(user_eiken_params)
    @user_programmings = current_user.user_programmings.all
  end
  
  private
      
      def user_toeic_params
        params.require(:user_toeic).permit(:toeic).merge(user_id: current_user.id)
      end
end
