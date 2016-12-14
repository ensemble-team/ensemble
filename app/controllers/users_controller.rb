class UsersController < ApplicationController

  helper_method :find_sender
  helper :all
  before_action :user_messages, :user_projects, :user_collaborations, :user_requests

  def show
    @user = User.find_by(username: params[:username])
  end

  def find_sender(message)
    User.find(message.sender)
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    @user.save!
    redirect_to request.referrer
  end

  private

  def user_messages
    find_user
    @messages = Message.where(recipient: @user.id)
  end

  def user_projects
    find_user
    @projects = Project.where(user_id: @user.id)
  end

  def user_collaborations
    find_user
    @branches = Branch.where(user_id: @user.id)
  end

  def user_requests
    find_user
    @requests = Request.where(collab_id: @user.id)
  end

  def find_user
    @user = User.find_by(username: params[:username])
  end

  def user_params
    params.require(:user).permit(:image, :bio)
  end

end
