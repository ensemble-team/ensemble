class ProjectsController < ApplicationController
helper :all
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
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

  private

  def project_params
    params.require(:project).permit(:title, :genre, :description)
  end

end
