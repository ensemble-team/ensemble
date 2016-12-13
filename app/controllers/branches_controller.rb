class BranchesController < ApplicationController

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
  end

  def destroy #add tests(feature and unit)
    @branch = Branch.find(params[:id]).destroy
    flash[:notice] = "Branch deleted"
    redirect_to projects_path
  end

  private
  def create_notification(project, branch)
    return if project.user_id == current_user.id
    Notification.create!(owner_id: branch.id,
                         owner_type: 'Branch',
                         user_id: project.user_id,
                         notified_by: current_user.id)
  end

  def branch_params
    params.require(:branch).permit(:title, :instrument, :description, :user_id)
  end

end
