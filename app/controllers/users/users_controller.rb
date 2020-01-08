class Users::UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@items = @user.items.page(params[:page]).reverse_order
		@evnet = Event.new
		@events = Event.all
		@events.each do |event|
			gon.event_title = event.title
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    	respond_to do |format|
	      if @user.update(user_params)
	        format.html { redirect_to @user, notice: 'User was successfully created.' }
	        format.json { render :show, status: :ok, location: @user }
	        format.js { @status = "success"}
	      else
	        format.html { render :show }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	        format.js { @status = "fail" }
	      end
    	end
	end

	def hide
	end

	private
	def user_params
	    params.require(:user).permit(:name, :email, :address, :profile_image)
	end
end
