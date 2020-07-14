class Mypage::NotificationController < ApplicationController
  before_action :logged_in_user
  def index
    @notifications = Notification.where(user_id: 16).where('start_on <=?',DateTime.current)
  end
end
