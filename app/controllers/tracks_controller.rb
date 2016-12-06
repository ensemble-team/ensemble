class TracksController < ApplicationController

  before_action :set_project

  def create
    @track = @project.tracks.build(track_params)
    @track.save
    flash[:notice] = "Track uploaded"
    redirect_to @project
  end

  def delete
  end



  private

  def track_params
    params.require(:track).permit(:title, :text , :avatar)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
