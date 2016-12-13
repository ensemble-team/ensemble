class CommentsController < ApplicationController


  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
    owner = @comment.owner_type.constantize
    @owner = owner.find(@comment.owner_id)
    redirect_to @owner
  end
  def create
    if params[:project_id]
      @comment_owner = Project.find(params[:project_id])
    elsif params[:branch_id]
        @comment_owner = Branch.find(params[:branch_id])
    end
    @comment = @comment_owner.comments.build(comment_params)
    if @comment.save
      create_notification(@comment_owner, @comment)
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

  def create_notification(comment_owner, comment)
    return if comment_owner.user_id == current_user.id
    Notification.create!(owner_id: comment.id,
                         owner_type: 'Comment',
                         user_id: comment_owner.user_id,
                         notified_by: current_user.id)
  end
end
