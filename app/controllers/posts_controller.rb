class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to current_user
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
