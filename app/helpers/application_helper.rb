# forms helper
module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @use ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
