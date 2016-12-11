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
  end


  private

  def branch_params
    params.require(:branch).permit(:title, :instrument, :description, :user_id)
  end

end
