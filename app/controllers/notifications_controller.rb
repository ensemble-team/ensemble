class NotificationsController < ApplicationController

  helper :all

  def link_through
    @notification = Notification.find(params[:notification_id])
    @notification.update({ read: true })
    if @notification.owner_type == "Message"
      redirect_to "/user/#{current_user.username}"
    elsif @notification.owner_type == "Branch"
      find_branch
      redirect_to @branch
    elsif @notification.owner_type == "Comment"
      find_comment
      redirect_to [@origin, @comment]
    elsif @notification.owner_type == "Track"
      find_track
      redirect_to @origin
    elsif @notification.owner_type == "Request"
      find_request
      if @origin.class == Branch
        project = Project.find(@origin.project_id)
        redirect_to project
      elsif @origin.class == Project
        redirect_to @origin
      end
    end
  end

  def find_branch
    @branch = Branch.find(@notification.owner_id)
  end

  def find_comment
    @comment = Comment.find(@notification.owner_id)
    @origin = @comment.owner_type.constantize.find(@comment.owner_id)
  end

  def find_track
    @track = Track.find(@notification.owner_id)
    @origin = @track.owner_type.constantize.find(@track.owner_id)
  end

  def find_request
    @request = Request.find(@notification.owner_id)
    @origin = @request.owner_type.constantize.find(@request.owner_id)
  end

  def index
    @notifications = Notification.where(user_id: current_user.id)
  end
end
