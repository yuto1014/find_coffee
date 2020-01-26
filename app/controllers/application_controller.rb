class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
		if admin_signed_in?
			admins_items_path
		else
			users_items_path
		end
	end

	def after_sign_out_path_for(resource)
		root_path
	end

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end

end
