module TracksHelper
  def track_origin
    if params[:project_id]
      @track_owner = Project.find(params[:project_id])
      @track = @track_owner.tracks.build(track_params)
    elsif params[:branch_id]
      @track_owner = Branch.find(params[:branch_id])
      @track = @track_owner.tracks.build(track_params)
    end
  end
  
  def create_notification(track_owner, track)
    if track_owner.class == Project
      Notification.create!(owner_id: track_owner.id,
                           owner_type: "Track",
                           user_id: track_owner.user_id,
                           notified_by: current_user.id)
    elsif track_owner.class == Branch
      project = Project.find(track_owner.project_id)
      Notification.create!(owner_id: track.id,
                           owner_type: "Track",
                           user_id: project.user_id,
                           notified_by: current_user.id)
    end
  end

end
