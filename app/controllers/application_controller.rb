class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username phonenumber])
  end

  private

  def authenticate_user!
    redirect_to root_path, alert: 'Пожалуйста, войдите в систему.' unless current_user
  end
end
