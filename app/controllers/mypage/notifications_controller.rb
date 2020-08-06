class Mypage::NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
  end
  
  def show
    @notification = Notification.find_by(id: params[:id])
  end
end
