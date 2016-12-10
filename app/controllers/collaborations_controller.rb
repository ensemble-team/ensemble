class CollaborationsController < ApplicationController
  helper :all


  def create
    @project = Project.find(params[:id])
    @collaboration = @project.collaborations.build()
  end

  def destroy
    @project = Project.find(params[:project_id])
    @collaboration = @project.collaborations.find(params[:id]).destroy
    flash[:notice] = "Collaboration deleted"
    redirect_to @project
  end
end
