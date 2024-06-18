class ApplicationController < ActionController::Base
  # helper_method :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phonenumber])
  end 

  private

  def authenticate_user!
    redirect_to root_path, alert: 'Пожалуйста, войдите в систему.' unless current_user
  end

end
