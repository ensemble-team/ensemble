class CollaborationsController < ApplicationController


  def create
    @project = Project.find(params[:id])
    @collaboration = @project.collaborations.build()
  end
end
