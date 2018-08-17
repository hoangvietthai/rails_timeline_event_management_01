class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new comment_params
    return if @comment.save
    flash[:danger] = t ".not_cmt"
    redirect_to home_path
  end

  private
  def comment_params
    params.require(:comment).permit :content, :event_id
  end
end
