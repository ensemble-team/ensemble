class RequestsController < ApplicationController

  def new
    @request =  Request.new
  end

  helper :all
  def create
    @branch = Branch.find(params[:branch_id])
    @project = Project.find(@branch.project_id)
    user = User.find(@project.user_id)
    @request = @branch.requests.build(request_params)
    @request.update({collab_id: current_user.id, owner_id: user.id, status: "In progress"} )
    if @request.save
      flash[:notice] = "Request sent successfully"
    else
      flash[:notice] = "Could not send the request, check the information entered"
    end
    redirect_to @branch

  end
  
  private

  def request_params
    params.require(:request).permit(:message)
  end
end
