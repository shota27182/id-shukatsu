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
    @user_toefl = current_user.user_toefl
  end
  
  def edit
    @user_toefl = current_user.user_toefl
  end
  
  def update
    @user_toefl = current_user.user_toefl
    @user_toefl.update(user_toefl_params)
    @user_toefl = current_user.user_toefl
  end
  
  private
      
      def user_toefl_params
        params.require(:user_toefl).permit(:toefl,:type).merge(user_id: current_user.id)
      end
end
