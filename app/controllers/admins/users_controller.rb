class Admins::UsersController < ApplicationController
	def index
		@user = User.all
	end

	def hide
		@user = User.find(params[:id])
		#論理削除による退会
    	@user.update(is_deleted: true)
    	redirect_to admin_items_path
	end
end
