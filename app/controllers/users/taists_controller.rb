class Users::TaistsController < ApplicationController
	before_action :authenticate_user!
	def new
		#cocoonで親子同時保存
		@taist = Taist.new
		@taist.items.build
	end

	def create
		@taist = Taist.new(taist_params)
    	# respond_to do |format|
	      if @taist.save
	      	@items = Item.order(created_at: :desc).limit(8)
	      	render :create
	        # format.html { redirect_to @taist, notice: 'Item was successfully created.' }
	        # format.json { render :show, status: :created, location: @taist }
	        # format.js { @status = "success"}
	      else
	      	render :create_error
	        # format.html { render :index }
	        # format.json { render json: @taist.errors, status: :unprocessable_entity }
	        # format.js { @status = "fail" }
	      end
	end

	private
	def taist_params
	    params.require(:taist).permit(:fruity, :refresh, :body, :bitter, items_attributes: [:id, :name, :opinion, :place, :roast, :food, :taist_id, :image, :user_id, :is_deleted])
	end
end

