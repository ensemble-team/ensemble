class BranchesController < ApplicationController

include BranchesHelper

  def new
    @branch = Branch.new
  end

  def create
    @project = Project.find(params[:project_id])
    @branch = @project.branches.build(branch_params)
    @branch.save!
    create_notification(@project, @branch)
    redirect_to @branch
  end

  def show
    @branch = Branch.find(params[:id])
    @project = Project.find(@branch.project_id)
    @branch_owner = User.find(@branch.user_id)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @branch = Branch.find(params[:id]).destroy
    flash[:notice] = "Branch deleted"
    redirect_to @project
  end

  private
  def branch_params
    params.require(:branch).permit(:title, :instrument, :description, :user_id)
  end

end
