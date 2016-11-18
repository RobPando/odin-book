class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      redirect_to root_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:reply)
  end
end
