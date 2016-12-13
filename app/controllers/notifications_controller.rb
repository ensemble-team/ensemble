class NotificationsController < ApplicationController

  def link_through
    @notification = Notification.find(params[:id])
    @notification.update({ read: true })
    redirect_to "/user/#{current_user.username}"
  end

  def index
    @notifications = Notification.where(user_id: current_user.id)
  end
end
