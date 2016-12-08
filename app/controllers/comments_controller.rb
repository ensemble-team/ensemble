class CommentsController < ApplicationController

  def create
    @track = Track.find(params[:track_id])
    @comment = @track.comments.create(comment_pararms)
    redirect_to track_path(@track)
  end

  private

  def comment_pararms
    params.require(:comment).permit(:commenter, :body)
  end

end
