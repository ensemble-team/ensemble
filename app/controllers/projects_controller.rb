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
    @project.update({user_id: current_user.id})
    if @project.save
      flash[:notice] = "Project created successfully"
      redirect_to @project
    else
      flash[:notice] = "Please enter a project title"
      redirect_to new_project_path
    end
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
    params.require(:project).permit(:title, :genre, :description)
  end

end
