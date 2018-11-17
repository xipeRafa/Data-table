class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  # helper_method :current_user
  #
  # def current_user
  #   @current_user ||= User.find(session[:user_id])
  # end
  def configure_permitted_parameters
    update_attrs = [:first_name, :last_name, :schooldistrict_id, :email, :password,
      :password_confirmation, :current_password]
    create_attrs = [:first_name, :last_name, :schooldistrict_id, :role,
      :school_id, :email, :password, :password_confirmation]

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(create_attrs)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(update_attrs)
    end
  end
end
