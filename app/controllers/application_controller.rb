class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  before_action :authenticate_user!

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :bio, :photo, :posts_counter, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :bio, :photo, :password, :current_password) }
  end
end
