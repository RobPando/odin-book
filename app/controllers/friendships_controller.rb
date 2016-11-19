class FriendshipsController < ApplicationController
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
    @request.update
    redirect_to root_url
  end

  # Cancel or Ignore Friendship or request
  def destroy
  end

  private

  def find_request
    @request = Friendship.find(params[:id])
  end

  def accept_request
    @request.accepted = true
  end

  def find_user
    @user = User.find(params[:friend_id])
  end
end
