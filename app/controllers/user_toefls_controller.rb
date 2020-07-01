class UserToeflsController < ApplicationController
  before_action :logged_in_user
  
  def index
  end
  
  def new
    @user_toefl = UserToefl.new
  end
  
  def create
    @user_toefl = UserToefl.new(user_toefl_params)
    @user_toefl.save
  end
  
  def edit
    @user_toefl = UserToefl.find_by(id: params[:id])
  end
  
  def update
    @user_toefl = UserToefl.update(user_toefl_params)
    @user_programmings = current_user.user_programmings.all
  end
  
  private
      
      def user_toefl_params
        params.require(:user_toefl).permit(:toefl,:type).merge(user_id: current_user.id)
      end
end
