class Mypage::NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.where('start_on <=?',DateTime.current)
  end
end
