class ProjectsController < ApplicationController
helper :all
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.save
    flash[:notice] = "Project created successfully"
    redirect_to @project
  end

  def show
    @project = Project.find(params[:id])
  end

  def download(track)
    send_file("https://ensemble-app.s3.amazonaws.com/" + track.path, :disposition => 'attachment', :url_based_filename => false)
  end

  private

  def project_params
    params.require(:project).permit(:title, :genre, :description)
  end

end
