class RequestsController < ApplicationController



  def create
    if params[:branch_id]
      p "here"
      @request_owner = Branch.find(params[:branch_id])
      @project = Project.find(@request_owner.project_id)
      user = User.find(@project.user_id)
      @request = @request_owner.requests.build(request_params)
      @request.update({collab_id: current_user.id, owner_id: user.id, status: "In progress"} )
    elsif params[:project_id]
      p "hello"
      @request_owner = Project.find(params[:project_id])
      user = User.find(@request_owner.user_id)
      @request = @request_owner.requests.build(request_params)
      @request.update({collab_id: current_user.id, owner_id: user.id, status: "In progress"} )
    end
    if @request.save
      flash[:notice] = "Request sent successfully"
    else
      flash[:notice] = "Could not send the request, check the information entered"
    end
    redirect_to @request_owner
  end


  def update
    def approve_request
      self.update({ status: "Approved"})
      # @collaboration = Collaboration.new
      # @collaboration.update({ collaborator: self.collab_id})

    end

    def reject_request
      self.update({ status: "Rejected"})
    end
  end

  private

  def request_params
    params.require(:request).permit(:message)
  end
end
