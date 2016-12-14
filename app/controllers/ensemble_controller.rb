class EnsembleController < ApplicationController

  def index
    @messages = Message.where(recipient: current_user.id)
  end
end
