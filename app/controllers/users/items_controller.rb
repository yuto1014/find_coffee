class Users::ItemsController < ApplicationController
	before_action :correct_user, only: [:edit, :update]
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
		@items = Item.order(created_at: :desc).limit(8)
		@all_ranks = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(8).pluck(:item_id))
		if @items
			@random = Item.order("RANDOM()").limit(8)
		end
		@taists = Taist.all
	end

	def index_add
		if params[:sort] == "1"
			@items = Item.page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "2"
			@items = Item.find(Like.group(:item_id).where(id: x).order('count(item_id) desc').pluck(:item_id))
			@items = Kaminari.paginate_array(@items).page(params[:page]).per(20)
		end
	end

	def follow_index
		@item_all = Item.all
		@user = User.find(current_user.id)
		@follow_users = @user.following
		@items = @item_all.where(user_id: @follow_users).order(created_at: :desc)
		@items = Kaminari.paginate_array(@items).page(params[:page]).per(20)
	end

	def show
		@item = Item.find(params[:id])
		gon.item_show = @item
		gon.taist_show = @item.taist
		@comment = Comment.new
    	@comments = @item.comments.order(created_at: :desc)
    	@taist_show = Taist.find_by(refresh: @item.taist.refresh, bitter: @item.taist.bitter, body: @item.taist.body, fruity: @item.taist.fruity)
	end

	def show_like
		@item = Item.find(params[:id])
	end

	def research
		@items = Item.all.order(created_at: :desc)
		@taist1 = Taist.where(refresh:3, bitter:0, body:0, fruity:3).order(created_at: :desc).limit(5)
		@taist2 = Taist.where(refresh:3, bitter:1, body:0, fruity:2).order(created_at: :desc).limit(5)
		@taist3 = Taist.where(refresh:2, bitter:0, body:1, fruity:3).order(created_at: :desc).limit(5)
		@taist4 = Taist.where(refresh:2, bitter:1, body:1, fruity:2).order(created_at: :desc).limit(5)
		@taist5 = Taist.where(refresh:3, bitter:2, body:0, fruity:1).order(created_at: :desc).limit(5)
		@taist6 = Taist.where(refresh:3, bitter:3, body:0, fruity:0).order(created_at: :desc).limit(5)
		@taist7 = Taist.where(refresh:2, bitter:2, body:1, fruity:1).order(created_at: :desc).limit(5)
		@taist8 = Taist.where(refresh:2, bitter:3, body:1, fruity:0).order(created_at: :desc).limit(5)
		@taist9 = Taist.where(refresh:1, bitter:0, body:2, fruity:3).order(created_at: :desc).limit(5)
		@taist10 = Taist.where(refresh:1, bitter:1, body:2, fruity:2).order(created_at: :desc).limit(5)
		@taist11 = Taist.where(refresh:0, bitter:0, body:3, fruity:3).order(created_at: :desc).limit(5)
		@taist12 = Taist.where(refresh:0, bitter:1, body:3, fruity:2).order(created_at: :desc).limit(5)
		@taist13 = Taist.where(refresh:1, bitter:2, body:2, fruity:1).order(created_at: :desc).limit(5)
		@taist14 = Taist.where(refresh:1, bitter:3, body:2, fruity:0).order(created_at: :desc).limit(5)
		@taist15 = Taist.where(refresh:0, bitter:2, body:3, fruity:1).order(created_at: :desc).limit(5)
		@taist16 = Taist.where(refresh:0, bitter:3, body:3, fruity:0).order(created_at: :desc).limit(5)
	end

	def taist_research
		if params[:sort] == "1"
			@taists = Taist.where(refresh:3, bitter:0, body:0, fruity:3).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "2"
			@taists = Taist.where(refresh:3, bitter:1, body:0, fruity:2).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "3"
			@taists = Taist.where(refresh:2, bitter:0, body:1, fruity:3).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "4"
			@taists = Taist.where(refresh:2, bitter:1, body:1, fruity:2).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "5"
			@taists = Taist.where(refresh:3, bitter:2, body:0, fruity:1).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "6"
			@taists = Taist.where(refresh:3, bitter:3, body:0, fruity:0).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "7"
			@taists = Taist.where(refresh:2, bitter:2, body:1, fruity:1).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "8"
			@taists = Taist.where(refresh:2, bitter:3, body:1, fruity:0).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "9"
			@taists = Taist.where(refresh:1, bitter:0, body:2, fruity:3).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "10"
			@taists = Taist.where(refresh:1, bitter:1, body:2, fruity:2).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "11"
			@taists = Taist.where(refresh:0, bitter:0, body:3, fruity:3).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "12"
			@taists = Taist.where(refresh:0, bitter:1, body:3, fruity:2).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "13"
			@taists = Taist.where(refresh:1, bitter:2, body:2, fruity:1).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "14"
			@taists = Taist.where(refresh:1, bitter:3, body:2, fruity:0).page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "15"
			@taists = Taist.where(refresh:0, bitter:2, body:3, fruity:1).page(params[:page]).per(20).order(created_at: :desc)
		else
			@taists = Taist.where(refresh:0, bitter:3, body:3, fruity:0).page(params[:page]).per(20).order(created_at: :desc)
		end
	end

	def destroy
		item = Item.find(params[:id])
    	item.destroy
    	redirect_to root_path
	end

	def search
      @items = Item.where('items.name LIKE(?)', "%#{params[:search]}%").page(params[:page]).per(20).order(created_at: :desc)
    end


	private
  	def item_params
    	params.require(:item).permit(:name, :image, :opinion, :place, :tast_id, :user_id)
  	end

	def correct_user
		@item = Item.find(params[:id])
		if current_user != @item.user
			redirect_to root_path
		end
    end

end
