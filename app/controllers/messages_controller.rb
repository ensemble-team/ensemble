class MessagesController < ApplicationController

  def create
      @message = current_user.messages.build(message_params)
      if @message.save
        create_notification(@message)
        flash[:notice] = "Message sent successfully"
      else
        flash[:notice] = "Could not send the message, check the information entered"
      end
      redirect_to request.referrer
  end

private

def create_notification(message)
  return if message.user_id == current_user.id
  if message.branch_id
    @message_owner = message.branch_id
  elsif message.project_id && message.branch_id == nil
    @message_owner = message.project_id
  else
    @message_owner = nil
  end

  Notification.create!(notification_owner_id: @message_owner,
                       notification_owner_type: 'Message',
                       user_id: message.recipient,
                       notified_by: current_user.id)
end

def message_params
  params.require(:message).permit(:body, :sender, :recipient, :branch_id, :project_id)
end


end
