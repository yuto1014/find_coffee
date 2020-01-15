class Users::TaistsController < ApplicationController
	def new
		@taist = Taist.new
		@taist.items.build
	end

	def create
		@taist = Taist.new(taist_params)
    	respond_to do |format|
	      if @taist.save!
	      	@items = Item.order(created_at: :desc).limit(4)
	        format.html { redirect_to @taist, notice: 'Item was successfully created.' }
	        format.json { render :show, status: :created, location: @taist }
	        format.js { @status = "success"}
	      else
	        format.html { render :index }
	        format.json { render json: @taist.errors, status: :unprocessable_entity }
	        format.js { @status = "fail" }
	      end
    	end
	end

	private
	def taist_params
	    params.require(:taist).permit(:fruity, :refresh, :body, :bitter, items_attributes: [:id, :name, :opinion, :place, :roast, :food, :taist_id, :image, :user_id, :is_deleted])
	end
end

