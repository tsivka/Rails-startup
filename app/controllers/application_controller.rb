class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def after_sign_in_path_for(resource)
  #   current_user_path
  # end
  # def after_sign_out_path_for(resource_or_scope)
  #   request.referrer
  # end
  layout Proc.new { |controller| controller.devise_controller? ? 'devise' : 'application' }
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name,:is_freelancer, :password, :password_confirmation]
    devise_parameter_sanitizer.for(:account_update) << [:is_freelancer, :first_name, :last_name]
  end
end
