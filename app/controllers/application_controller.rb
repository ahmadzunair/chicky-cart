class ApplicationController < ActionController::Base
	add_flash_types :info, :error, :warning, :alert
  	protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if resource.admin?
		  admin_users_path
		elsif resource.seller? && resource.is_complete == true && resource.is_subscription == false
			is_approved_account_seller_users_path
		elsif resource.seller? && resource.is_complete == false
		   form_wizard_seller_users_path
    	end
  	end

    protected

    def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    end
end
