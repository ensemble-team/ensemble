class RequestsController < ApplicationController


  def create
    if params[:branch_id]
      @request_owner = Branch.find(params[:branch_id])
      @request = @request_owner.requests.build(request_params)
    elsif params[:project_id]
      @request_owner = Project.find(params[:project_id])
      @request = @request_owner.requests.build(request_params)
    end
    if @request.save
      flash[:notice] = "Request sent successfully"
    else
      flash[:notice] = "Could not send the request, check the information entered"
    end
    redirect_to request.referrer
  end

  def show
    @request = Request.find(params[:id])
  end

  def approve
    @request = Request.find(params[:request_id])
    @request.update({ status: "Approved"})
    @collaboration = Collaboration.new ({ collaborator: @request.collab_id, project_id: @request.request_owner_id})
    @collaboration.save!

  end

  def reject
    @request = Request.find(params[:request_id])
    @request.update({ status: "Rejected"})
  end

  private

  def request_params
    params.require(:request).permit(:message, :collab_id, :owner_id, :status)
  end
end
