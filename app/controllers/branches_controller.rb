class BranchesController < ApplicationController

  def new
    @branch = Branch.new
  end

  def create
    @project = Project.find(params[:project_id])
    @branch = @project.branches.build(branch_params)
    @branch.update({ user_id: current_user.id })
    @branch.save!
    redirect_to @branch
  end

  def show
    @branch = Branch.find(params[:id])
  end


  private

  def branch_params
    params.require(:branch).permit(:title, :instrument, :description)
  end

end
