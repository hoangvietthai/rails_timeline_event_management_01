class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new comment_params
    if @comment.save
      create_real_time
    else
      flash[:danger] = t ".not_cmt"
      redirect_to home_path
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    return if @comment.destroy
    flash[:danger] = t ".not_cmt"
    redirect_to home_path
  end

  private

  def comment_params
    params.require(:comment).permit :content, :event_id
  end

  def create_real_time
    ActionCable.server.broadcast "comments",
      comment_id: @comment.id,
      content: @comment.content,
      email: current_user.email,
      time: Time.now.to_i - @comment.created_at.to_i
    head :ok
  end
end
