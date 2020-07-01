class UserProgrammingsController < ApplicationController
  before_action :logged_in_user
  
  def index
  end
  
  def new
    @user_programming = UserProgramming.new
  end
  
  def create
    @user_programming = UserProgramming.new(user_programming_params)
    @user_programming.save
    @user_programmings = current_user.user_programmings.all
  end
  
  def edit
    @user_programming = UserProgramming.find_by(id: params[:id])
  end
  
  def update
    @user_programming = UserProgramming.update(user_programming_params)
    @user_programmings = current_user.user_programmings.all
  end
  
  private
      
      def user_programming_params
        params.require(:user_programming).permit([:programming_id,:description,:use_time]).merge(user_id: current_user.id)
      end
end
