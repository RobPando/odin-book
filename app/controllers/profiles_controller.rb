class ProfilesController < ApplicationController
  def show
    load_user
    build_post
    load_posts
    load_profile
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
      render 'edit'
    end
  end

  private

  def insert_attributes_to_profile
    @profile.attributes = profile_params
  end

  def profile_params
    params.require(:profile).permit(:gender,
                                    :status,
                                    :quote,
                                    :birthdate,
                                    :work,
                                    :education,
                                    :description,
                                    :live,
                                    :hometown,
                                    :nickname)
  end

  def load_user
    @user = User.find(params[:user_id])
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
end
