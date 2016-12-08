class TracksController < ApplicationController

  before_action :set_project

  def index
  end

  def create
    @track = @project.tracks.build(track_params)

    if @track.save
      flash[:notice] = "Track uploaded"
    else
      flash[:notice] = "Could not save the track, check the information entered"
    end
    redirect_to @project
  end

  def destroy
    @track = @project.tracks.find(params[:id]).destroy
    flash[:notice] = "Track deleted"
    redirect_to @project
  end

  private

  def track_params
    params.require(:track).permit(:title, :text , :avatar)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
