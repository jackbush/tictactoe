class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  alias_method :current_user, :current_player

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |p| p.permit(:username, :email, :password,
      :password_confirmation, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.for(:account_update) { |p| p.permit(:username, :email, :password,
      :password_confirmation, :current_password, :avatar, :avatar_cache) }
  end

end
