module CommentsHelper
  def create_notification(comment_owner, comment)
    return if comment_owner.user_id == current_user.id
    Notification.create!(owner_id: comment.id,
                         owner_type: 'Comment',
                         user_id: comment_owner.user_id,
                         notified_by: current_user.id)
  end
end
