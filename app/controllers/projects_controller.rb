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

  def download(avatar)
    send_file "public/#{avatar}", :disposition => 'attachement'
    # redirect_to("index")
  end

  private

  def project_params
    params.require(:project).permit(:title, :genre, :description,{avatars: []})
  end

end
