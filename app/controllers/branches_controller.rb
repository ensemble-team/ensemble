class BranchesController < ApplicationController

  def new
    @branch = Branch.new
  end

  def create
    @project = Project.find(params[:project_id])
    @branch = @project.branches.build(branch_params)
    @branch.save!
    redirect_to @branch
  end

  def show
    @branch = Branch.find(params[:id])
    @project = Project.find(@branch.project_id)
  end

  def destroy #add tests(feature and unit)
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
