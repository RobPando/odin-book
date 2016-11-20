class FriendshipsController < ApplicationController

  def index
    load_user
    all_friends
    @friendships << all_inverse_friends
  end

  # Request friendship
  def create
    find_user
    current_user.send_friend_request(@user)
    redirect_to @user
  end

  # Accept Friendship request
  def update
    find_request
    accept_request
    redirect_to root_url
  end

  # Cancel or Ignore Friendship or request
  def destroy
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end

  def all_friends
    @friendships = @user.friends
  end

  def all_inverse_friends
    @inverse_friends = @user.inverse_friends
  end

  def find_request
    @request = Friendship.find(params[:id])
  end

  def accept_request
    @request.update(accepted: true)
  end

  def find_user
    @user = User.find(params[:friend_id])
  end
end
