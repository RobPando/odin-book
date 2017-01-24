# User's profile
class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_owner, only: [:edit, :update]

  def show
    load_user
    build_post
    load_profile
    load_posts
    unless owner?(@user)
      @posts = [] unless they_are_friends?(@user)
    end
  end

  def edit
    load_user
    load_profile
  end

  def update
    load_user
    load_profile
    insert_attributes_to_profile

    if @profile.save
      redirect_to user_profile_path(@user)
    else
      render :edit
    end
  end

  private

  def insert_attributes_to_profile
    @profile.attributes = profile_params
  end

  def profile_params
    params.fetch(:profile, {}).permit(:gender,
                                      :status,
                                      :quote,
                                      :birthdate,
                                      :work,
                                      :education,
                                      :description,
                                      :live,
                                      :hometown,
                                      :nickname,
                                      :avatar)
  end

  def load_user
    @user ||= User.find(params[:user_id])
  end

  def load_profile
    @profile = @user.profile
  end

  def build_post
    @post = @user.posts.build
  end

  def load_posts
    @posts = @user.posts.all
  end

  def verify_owner
    load_user
    redirect_to root_url unless owner?(@user)
  end

  def they_are_friends?(user)
    current_user.friends?(user) || current_user.inverse_friends?(user)
  end
end
