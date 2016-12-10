class MessagesController < ApplicationController

  def create
      @message = current_user.messages.build(message_params)
      if @message.save
        flash[:notice] = "Message sent successfully"
      else
        flash[:notice] = "Could not send the message, check the information entered"
      end
  end

private

def message_params
  params.require(:message).permit(:body, :sender, :recipient, :branch_id, :project_id)
end


end
