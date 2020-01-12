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
		@items = Item.all.order(created_at: :desc).limit(4)
		@all_ranks = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(8).pluck(:item_id))
		@random = Item.order("RANDOM()").limit(8)
		@taists = Taist.all
	end

	def show
		@item = Item.find(params[:id])
		gon.item = @item
		gon.taist = @item.taist
		@comment = Comment.new #①
    	@comments = @item.comments #②
	end

	def research
		@items = Item.all.order(created_at: :desc)
		@taist1 = Taist.where(refresh:3, bitter:0, body:0, fruity:3)
	end

	private
  	def item_params
    	params.require(:item).permit(:name, :image, :opinion, :place, :tast_id, :user_id)
  	end


end
