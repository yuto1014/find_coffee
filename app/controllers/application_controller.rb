class ApplicationController < ActionController::Base
	#サインイン後のパス
	def after_sign_in_path_for(resource)
		#管理者かどうか
		if admin_signed_in?
			admins_items_path
		else
			users_items_path
		end
	end
	#サインアウト後のパス
	def after_sign_out_path_for(resource)
		root_path
	end

	before_action :configure_permitted_parameters, if: :devise_controller?
	#名前とアドレス(地域)を保存する
	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end

end
