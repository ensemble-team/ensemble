class NotificationsController < ApplicationController

  helper :all
  include NotificationsHelper

  def index
    @notifications = Notification.where(user_id: current_user.id)
  end

  def link_through
    @notification = Notification.find(params[:notification_id])
    @notification.update({ read: true })
    case @notification.owner_type
    when "Message"
      redirect_to "/user/messages"
    when "Branch"
      find_branch
      redirect_to @branch
    when "Comment"
      find_comment
      redirect_to [@origin, @comment]
    when "Track"
      find_track
      redirect_to @origin
    when "Request"
      find_request
      if @origin.class == Branch
        redirect_to @request
      elsif @origin.class == Project
        redirect_to @origin
      end
    when "Approve Collab"
      redirect_to "/user/#{current_user.username}"
    when "Approve Mix"
      redirect_to "/user/#{current_user.username}"
    when "Reject Collab"
        redirect_to "/user/#{current_user.username}"
    when "Reject Mix"
        redirect_to "/user/#{current_user.username}"
    end
  end
end
