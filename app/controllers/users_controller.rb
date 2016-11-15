# Philippians 1:21
class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    load_all_users
  end

  def show
    load_user
  end

  def edit
  end

  def update
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def load_all_users
    @users ||= fetch_all
  end

  def fetch_all
    User.all
  end

  def load_user
    @user ||= User.find(params[:id])
  end
end
