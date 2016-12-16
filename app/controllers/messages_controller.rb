class MessagesController < ApplicationController

include MessagesHelper

  def index
    @messages = Message.where(recipient: current_user.id)
    @sent_messages = Message.where(sender: current_user.id)
  end

  def create
      @message = current_user.messages.build(message_params)
      if @message.save
        create_notification(@message)
        flash[:notice] = "Message sent successfully"
      else
        flash[:notice] = "You need to enter a message before pressing send"
      end
      redirect_to request.referrer
  end

  def show
    @messages = Message.where(recipient: current_user.id)
    @message = Message.find(params[:id])
    @message.update(read: "read")
  end

private
def message_params
  params.require(:message).permit(:body, :sender, :recipient, :branch_id, :project_id)
end

end
