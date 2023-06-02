class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    # ...

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :sex,:position, :shift,:admin,:salary, :phone])
      devise_parameter_sanitizer.permit(:create, keys: [:name, :birthday, :phone_number, :admin])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :birthday, :phone_number, :admin])
    end
end
