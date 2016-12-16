class RequestsController < ApplicationController

include RequestsHelper
  def create
      if params[:branch_id]
        @request_owner = Branch.find(params[:branch_id])
        @request = @request_owner.requests.build(request_params)
      elsif params[:project_id]
        @request_owner = Project.find(params[:project_id])
        @request = @request_owner.requests.build(request_params)
      end
    if @request.save
      create_notification(@request_owner, @request)
      flash[:notice] = "Request sent successfully"
    else
      flash[:notice] = "You need to enter a message before pressing send"
    end
    redirect_to request.referrer
  end

  def show
    @request = Request.find(params[:id])
  end

  def destroy
    @request = Request.find(params[:id])
    @request.destroy
    redirect_to request.referrer
  end

  private
  def request_params
    params.require(:request).permit(:message, :collab_id, :owner_id, :status)
  end
end
