class TracksController < ApplicationController

  def new
    @track = Track.new
  end

  def index
  end

  def show
    @track = Track.find(params[:id])

  end
  def create
    if params[:project_id]
      @track_owner = Project.find(params[:project_id])
    elsif params[:branch_id]
      @track_owner = Branch.find(params[:branch_id])
    end
    @track = @track_owner.tracks.build(track_params)
    if @track.save
      create_notification(@track_owner, @track)
      flash[:notice] = "Track uploaded"
    else
      flash[:notice] = "Could not save the track, check the information entered"
    end
    redirect_to request.referrer
  end

  def destroy
    if params[:project_id]
      @track_owner = Project.find(params[:project_id])
    elsif params[:branch_id]
      @track_owner = Branch.find(params[:branch_id])
    end
    @track = @track_owner.tracks.find(params[:id]).destroy
    flash[:notice] = "Track deleted"
    redirect_to @track_owner
  end

  private

  def create_notification(track_owner, track)
    if params[:project_id]
    project = Project.find(params[:project_id])
    Notification.create!(owner_id: project.id,
                         owner_type: 'Track',
                         user_id: project.user_id,
                         notified_by: current_user.id)
     elsif params[:branch_id]
     project = Project.find(track_owner.project_id)
     Notification.create!(owner_id: track_owner.id,
                          owner_type: 'Track',
                          user_id: project.user_id,
                          notified_by: current_user.id)
    end
  end

  def track_params
    params.require(:track).permit(:title, :text , :avatar, :user_id)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
