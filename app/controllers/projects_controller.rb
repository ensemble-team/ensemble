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
      redirect_to @project
    else
      flash[:notice] = "Please enter a project title"
      redirect_to new_project_path
    end
  end

  def show
    @project = Project.find(params[:id])
    @project_owner = User.find(@project.user_id)
  end

  def destroy
    p "hello"
    Project.find(params[:id]).destroy
    flash[:notice] = "Project deleted"
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :genre, :description, :user_id)
  end

end
