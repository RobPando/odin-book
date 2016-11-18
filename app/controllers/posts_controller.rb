class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    build_post
    @post.save
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def build_post
    @post = current_user.posts.build(post_params)
  end
end
