module RequestsHelper
  def approve_collab
    @request = Request.find(params[:request_id])
    @request.update({ status: "Approved"})
    @collaboration = Collaboration.new ({ collaborator: @request.collab_id, project_id: @request.owner_id})
      if @collaboration.save!
        notify_collab(@request)
        flash[:notice] = "Collaboration approved"
      end
    redirect_to request.referrer
  end

  def reject_collab
    @request = Request.find(params[:request_id])
    @request.update({ status: "Rejected"})
      notify_reject_collab(@request)
      flash[:notice] = "Collaboration rejected"
      redirect_to request.referrer
  end

  def approve_mix
    @request = Request.find(params[:request_id])
    @request.update({ status: "Approved"})
    @branch = Branch.find(@request.owner_id)
    @project = Project.find(@branch.project_id)
    @branch.tracks.each do |track|
      @project.tracks.each do |t|
        if t.update ({ avatar: track.avatar })
          notify_mix(@request)
          flash[:notice] = "Mix approved"
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
    notify_reject_mix(@request)
    flash[:notice] = "Mix rejected"
    redirect_to @project
  end

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

  def kill_all_requests
    @request = Request.find(params[:request_id])
    collab = @request.collab_id
    @list = Request.where({collab_id: collab})
    @list.each do |r|
      r.destroy
    end
    redirect_to request.referrer
  end

  def notify_collab(request)
    Notification.create!(owner_id: request.id,
                         owner_type: 'Approve Collab',
                         user_id: request.collab_id,
                         notified_by: current_user.id)
  end

  def notify_mix(request)
    Notification.create!(owner_id: request.id,
                         owner_type: 'Approve Mix',
                         user_id: request.collab_id,
                         notified_by: current_user.id)

  end

  def notify_reject_collab(request)
    Notification.create!(owner_id: request.id,
                         owner_type: 'Reject Collab',
                         user_id: request.collab_id,
                         notified_by: current_user.id)
  end

  def notify_reject_mix(request)
    Notification.create!(owner_id: request.id,
                         owner_type: 'Reject Mix',
                         user_id: request.collab_id,
                         notified_by: current_user.id)

  end

end
