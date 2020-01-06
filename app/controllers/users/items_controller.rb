class Users::ItemsController < ApplicationController
	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@taists = Taist.all
    	respond_to do |format|
	      if @item.save
	        format.html { redirect_to @item, notice: 'Item was successfully created.' }
	        format.json { render :index, status: :created, location: @item }
	        format.js { @status = "success"}
	      else
	        format.html { render :index }
	        format.json { render json: @item.errors, status: :unprocessable_entity }
	        format.js { @status = "fail" }
	      end
    	end
	end

	def edit
	end

	def update
	end

	def index
		@items = Item.all.order(created_at: :desc)
		@taists = Taist.all
	end

	def show
	end

	private
  	def item_params
    	params.require(:item).permit(:name, :image, :opinion, :place, :tast_id)
  	end


end
