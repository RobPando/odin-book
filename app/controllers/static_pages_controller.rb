# Starting controller
class StaticPagesController < ApplicationController
  def home
    redirect_to user_profile_path(current_user) if user_signed_in?
  end
end
