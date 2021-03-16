class ApplicationController < ActionController::Base
  
  is_cancan=true
  begin
    Kernel.const_get('CanCan')
  rescue
    is_cancan=false
  end

  if is_cancan
    rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = 'Access denied.'
      redirect_to root_url
    end
  end

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

 protected

 def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
 end
  #protect_from_forgery with: :exception
  
end
