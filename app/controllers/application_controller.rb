class ApplicationController < ActionController::Base
    
    protect_from_forgery with: :exception, prepend: true
    
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
            user_params.permit(:username, :cpf, :email, :password, :password_confirmation,
            :current_password)
        end
        devise_parameter_sanitizer.permit(:account_update) do |user_params|
            user_params.permit(:username, :cpf, :email, :password, :password_confirmation,
            :current_password)
        end
    end
end
