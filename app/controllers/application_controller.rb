class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 helper_method :current_user
include ApplicationHelper
  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def check_user_role
    unless current_user && current_user.is_admin
      redirect_to root_path
    end
  end
end
