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
    if params[:project_id]
      @request = Request.find(params[:id])
      redirect_to request_approve_mix_path
    end

    @request = Request.find(params[:id])
  end

  def approve_collab
    @request = Request.find(params[:request_id])
    @request.update({ status: "Approved"})
    @collaboration = Collaboration.new ({ collaborator: @request.collab_id, project_id: @request.request_owner_id})
      if @collaboration.save!
        flash[:notice] = "Approved collaborator"
      else
        flash[:notice] = "Rejected collaborator"
      end
    redirect_to request.referrer
  end

  def reject_collab
    @request = Request.find(params[:request_id])
    @request.update({ status: "Rejected"})
  end

  def approve_mix
    @request = Request.find(params[:request_id])
    @request.update({ status: "Approved"})
    @branch = Branch.find(@request.request_owner_id)
    @branch.tracks.each do |track|
      @project = Project.find(@branch.project_id)
      @project.tracks.each do |t|
        if t.update ({ avatar: track.avatar })
          flash[:notice] = "Approved mix"
        else
          flash[:notice] = "Rejected mix"
        end
      end
    end
    redirect_to projects_path
  end

  def reject_mix
    @request = Request.find(params[:request_id])
    @request.update({ status: "Rejected"})
    flash[:notice] = "Rejected mix"
    redirect_to projects_path
  end

  private

  def request_params
    params.require(:request).permit(:message, :collab_id, :owner_id, :status)
  end
end
