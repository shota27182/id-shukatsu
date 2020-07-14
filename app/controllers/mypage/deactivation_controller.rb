class Mypage::DeactivationController < ApplicationController
  def index
    @user_deactivation = UserDeactivation.new
  end
  
  def create
    @user_deactivation = UserDeactivation.new(leave_reason: params[:leave_reason], improve_point: params[:improve_point], user: current_user.id)
    @user_deactivation.save
    @user = current_user
    @user.destroy
    redirect_to login_path
  end
  
end
