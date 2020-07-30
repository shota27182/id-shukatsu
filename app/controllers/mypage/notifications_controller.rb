class Mypage::NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.where('start_on <=?',DateTime.current)
  end
  
  def show
    @notification = Notification.find_by(id: params[:id])
  end
end
