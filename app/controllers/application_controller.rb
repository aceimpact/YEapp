class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :name, :image)}
   devise_parameter_sanitizer.permit(:sign_in){|u| u.permit(:user_id, :password, :remember_me)}
   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
 end

end
