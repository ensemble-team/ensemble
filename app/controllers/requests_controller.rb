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
      create_notification(@request_owner, @request)
      flash[:notice] = "Request sent successfully"
    else
      flash[:notice] = "Could not send the request, check the information entered"
    end
    redirect_to request.referrer
  end

  def show
    @request = Request.find(params[:id])
    owner = @request.owner_type.constantize
    @owner = owner.find(@request.owner_id)
    redirect_to @owner
  end


  def approve
    @request = Request.find(params[:request_id])
    @request.update({ status: "Approved"})
    @collaboration = Collaboration.new ({ collaborator: @request.collab_id, project_id: @request.owner_id})
    @collaboration.save!

  end

  def reject
    @request = Request.find(params[:request_id])
    @request.update({ status: "Rejected"})
  end

  private


  def create_notification(request_owner, request)
    return if request_owner.user_id == current_user.id
    Notification.create!(owner_id: request_owner.id,
                         owner_type: 'Request',
                         user_id: request.owner_id,
                         notified_by: current_user.id)
  end

  def request_params
    params.require(:request).permit(:message, :collab_id, :owner_id, :status)
  end
end
