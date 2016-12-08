class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
  
    @project = Project.find(params[:project_id])
    @comment = Comment.new(comment_pararms)
    @comment.update({user_id: current_user.id, comment_owner_id: @project.id, comment_owner_type: Project })
    @comment.save!
    redirect_to @project
  end

  private

  def comment_pararms
    params.require(:comment).permit(:body)
  end

end
