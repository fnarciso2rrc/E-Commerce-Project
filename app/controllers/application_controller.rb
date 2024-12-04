class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?


  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  protected

  # Permit custom parameters for user update and registration
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:street_address, :city, :postal_code, :province_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:street_address, :city, :postal_code, :province_id])
  end
end
