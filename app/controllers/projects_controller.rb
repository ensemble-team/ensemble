class ProjectsController < ApplicationController
helper :all

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
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

  def destroy
    Project.find(params[:id]).destroy
    flash[:notice] = "Project deleted"
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :genre, :description, :user_id)
  end

end
