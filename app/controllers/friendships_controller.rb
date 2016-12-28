class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_requestee, only: [:update]

  def index
    load_user
    all_friends
    @friendships += all_inverse_friends
  end

  # Request friendship
  def create
    find_user_friending
    current_user.send_friend_request(@user_friending)
    redirect_to @user_friending
  end

  # Accept Friendship request
  def update
    find_request
    accept_request
    redirect_to root_url
  end

  # Cancel or Ignore Friendship or request
  def destroy
    find_request
    @request.destroy
    redirect_to root_url
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def all_friends
    @friendships ||= @user.friends.all
  end

  def all_inverse_friends
    @inverse_friendships = @user.inverse_friends.all
  end

  def find_request
    @request = Friendship.find(params[:id])
  end

  def accept_request
    @request.update(accepted: true)
  end

  def find_user_friending
    @user_friending = User.find(params[:friend_id])
  end

  def verify_requestee
    find_request
    redirect_to root_url unless requestee?(@request)
  end

  def requestee?(request)
    request.friend_id == current_user.id
  end
end
