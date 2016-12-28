# Comment creation
class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    build_comment
    if @comment.save
      redirect_to post_path(@comment.post)
    else
      redirect_to root_url
    end
  end

  private

  def comment_params
    params.fetch(:comment, {}).permit(:reply)
  end

  def build_comment
    @comment = current_user.comments.build
    @comment.attributes = comment_params
    @comment.post_id = params[:post_id] if params[:post_id]
  end
end
