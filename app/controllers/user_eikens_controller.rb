class UserEikensController < ApplicationController
  before_action :logged_in_user
  
  def index
  end
  
  def new
    @user_eiken = UserEiken.new
  end
  
  def create
    @user_eiken = UserEiken.new(user_eiken_params)
    @user_eiken.save
    @user_eiken = current_user.user_eiken
  end
  
  def edit
    @user_eiken = current_user.user_eiken
  end
  
  def update
    @user_eiken = current_user.user_eiken
    @user_eiken.update(user_eiken_params)
    @user_eiken = current_user.user_eiken
  end
  
  private
      
      def user_eiken_params
        params.require(:user_eiken).permit(:eiken).merge(user_id: current_user.id)
      end
end
