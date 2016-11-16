class CommentsController < ApplicationController
  def create
    # Implement
  end

  private

  def comment_params
    params.require(:comment).permit(:reply)
  end
end
