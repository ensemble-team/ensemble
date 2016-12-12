class CommentsController < ApplicationController


  def new
    @comment = Comment.new
  end

  def create
    if params[:project_id]
      @comment_owner = Project.find(params[:project_id])
    elsif params[:branch_id]
        @comment_owner = Branch.find(params[:branch_id])
    end
    @comment = @comment_owner.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment added"
    else
      flash[:notice] = "Could not save the comment, check the information entered"
    end
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

end
