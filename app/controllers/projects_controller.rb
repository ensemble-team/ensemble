class ProjectsController < ApplicationController
helper :all
  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    @project.update({user_id: current_user.id})
    @project.save!
    if @project.save
    flash[:notice] = "Project created successfully"
  else
    flash[:notice] = "Could not save the project, check the information entered"
    end
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
