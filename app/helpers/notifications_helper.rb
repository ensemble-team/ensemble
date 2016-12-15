module NotificationsHelper
  
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

end
