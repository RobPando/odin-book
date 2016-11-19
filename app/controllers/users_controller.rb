# Philippians 1:21
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search]
      if params[:search].split(' ').size == 2
        scoped_users
      else
        first_name_users
      end
    else
      load_all_users
    end
  end

  def show
    load_user
    redirect_to user_profile_path(@user)
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

  def first_name_users
    @users = fetch_all.where(first_name: params[:search].downcase.capitalize)
  end

  def scoped_users
    split_names
    @users = fetch_all.where(first_name: @name.first.downcase.capitalize,
                             last_name: @name.last.downcase.capitalize)
  end

  def split_names
    @name = params[:search].split(' ')
  end
end
