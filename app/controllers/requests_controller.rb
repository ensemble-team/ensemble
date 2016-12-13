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
  end

  def approve_collab
    @request = Request.find(params[:request_id])
    @request.update({ status: "Approved"})
    @collaboration = Collaboration.new ({ collaborator: @request.collab_id, project_id: @request.owner_id})
      if @collaboration.save!
        flash[:notice] = "Approved collaborator"
      end
    redirect_to request.referrer
  end

  def reject_collab
    @request = Request.find(params[:request_id])
    @request.update({ status: "Rejected"})
      flash[:notice] = "Rejected collaborator"
      redirect_to request.referrer
  end

  def approve_mix
    @request = Request.find(params[:request_id])
    @request.update({ status: "Approved"})
    @branch = Branch.find(@request.owner_id)
    @branch.tracks.each do |track|
      @project = Project.find(@branch.project_id)
      @project.tracks.each do |t|
        if t.update ({ avatar: track.avatar })
          flash[:notice] = "Approved mix"
        end
      end
    end
    redirect_to @project
  end

  def reject_mix
    @request = Request.find(params[:request_id])
    @branch = Branch.find(@request.owner_id)
    @project = Project.find(@branch.project_id)
    @request.update({ status: "Rejected"})
    flash[:notice] = "Rejected mix"
    redirect_to @project
  end

  private


  def create_notification(request_owner, request)
   if request_owner.class == Project
     Notification.create!(owner_id: request.id,
                          owner_type: 'Request',
                          user_id: request_owner.user_id,
                          notified_by: current_user.id)
   elsif request_owner.class == Branch
     project = Project.find(request_owner.project_id)
     Notification.create!(owner_id: request.id,
                          owner_type: 'Request',
                          user_id: project.user_id,
                          notified_by: current_user.id)
   end
  end

  def request_params
    params.require(:request).permit(:message, :collab_id, :owner_id, :status)
  end
end
