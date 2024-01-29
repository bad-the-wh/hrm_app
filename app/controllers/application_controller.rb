    class ApplicationController < ActionController::Base
        # Skip CSRF protection
        skip_before_action :verify_authenticity_token
    
        before_action :configure_permitted_parameters, if: :devise_controller?
    
        # Set CSRF token in response headers
        after_action :set_csrf_headers
    
        protected
    
        def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
        end
    
        private
    
        def set_csrf_headers
            response.headers['X-CSRF-Token'] = form_authenticity_token unless request.format.json?
        end          

        def after_sign_in_path_for(resource)
            # Customize the path where the user is redirected after sign-in
            root_path
        end
    end
    