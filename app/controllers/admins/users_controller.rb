class Admins::UsersController < ApplicationController
	def index
		@user = User.all
	end

	def hide
		@user = User.find(params[:id])
    	@user.update(is_deleted: true)
    	redirect_to admin_items_path
	end
end
