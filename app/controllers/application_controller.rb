class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  before_filter :configure_permitted_parameters, if: :devise_controller?



  #before_filter :cors_preflight_check, :cors_set_access_control_headers

  

# For all responses in this controller, return the CORS access control headers.

#def cors_set_access_control_headers
#  headers['Access-Control-Allow-Origin'] = '*'
#  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
#  headers['Access-Control-Request-Method'] = '*'
#  headers['Access-Control-Allow-Headers'] = '*'
#  headers['Access-Control-Max-Age'] = "1728000"
#end

# def cors_preflight_check
#  if request.method == :options
#    headers['Access-Control-Allow-Origin'] = '*'
#    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
#    headers['Access-Control-Allow-Headers'] = '*'
#    headers['Access-Control-Request-Method'] = '*'
#    headers['Access-Control-Max-Age'] = '1728000'
#    render :text => '', :content_type => 'text/plain'
#  end
#end
  
    protected

   

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :nickname, :subscriber, :terms, :avatar, :e) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :avatar, :nickname, :subscriber, :terms) }
    end
end
