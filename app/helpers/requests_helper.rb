module RequestsHelper
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
end
