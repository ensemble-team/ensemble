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
    @track.update({ user_id: current_user.id })
    if @track.save
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

  def track_params
    params.require(:track).permit(:title, :text , :avatar)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
