class PostsController < ApplicationController
  before_action :authenticate_user!
  # before_action :verify_owner, only: [:edit, :update]
  def index
    build_post
    home_feed
  end

  def show
    load_post
    load_comments
    build_comment
  end

  def create
    build_post
    @post.save
    redirect_to root_url
  end

  private

  def post_params
    params.fetch(:post, {}).permit(:content)
  end

  def build_post
    @post ||= current_user.posts.build
    @post.attributes = post_params
  end

  def load_post
    @post = Post.find(params[:id])
  end

  def load_comments
    @comments = @post.comments
  end

  def build_comment
    @comment = @post.comments.build
  end

  def home_feed
    @posts_feed = current_user.feed
    @posts_feed += current_user.inverse_feed
  end
end
