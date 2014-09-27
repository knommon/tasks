class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # works with single deivse controller, User
  before_filter :configure_devise_params, if: :devise_controller?
    def configure_devise_params
      devise_parameter_sanitizer.for(:sign_up) << UsersController.extra_params
      devise_parameter_sanitizer.for(:account_update) << UsersController.extra_params
    end
end
