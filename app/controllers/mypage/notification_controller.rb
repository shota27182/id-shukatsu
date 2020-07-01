class Mypage::NotificationController < ApplicationController
  before_action :logged_in_user
  def index
    @notifications = Notification.where(user_id: [current_user.id]).where('start_on <= ?', Date.today)
  end
end
