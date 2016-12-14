module MessagesHelper
  def create_notification(message)
    if message.branch_id
      @message_owner = message.branch_id
    elsif message.project_id && message.branch_id == nil
      @message_owner = message.project_id
    else
      @message_owner = nil
    end
    Notification.create!(owner_id: @message_owner,
                         owner_type: 'Message',
                         user_id: message.recipient,
                         notified_by: current_user.id)
  end
end
