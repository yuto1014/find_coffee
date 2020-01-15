class Users::UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@items = @user.items.page(params[:page]).reverse_order
		@events = Event.where(user_id: @user.id)
		@event = Event.new
		@likes = Like.where(user_id: @user.id).order(created_at: :desc)
		@like_items = @likes.take(8)
		logger.debug(@likes)
		if @likes.exists?
			logger.debug("likes")
			# binding.pry
			#like = そのユーザーのいいねid
			like = @likes.last
			logger.debug(like)
			#item = likeのitem_idが含まれるitem.id
			item = like.item
			logger.debug(item)
			#item_recommend = itemと同じtaist
			taist_recommend = Taist.find_by(refresh: item.taist.refresh, bitter: item.taist.bitter, body: item.taist.body, fruity: item.taist.fruity)
			logger.debug(taist_recommend)
			#item_recommend = taist_recommendと同じアイテムを全て
			item_recommend = taist_recommend.items
			logger.debug(item_recommend)
			#いいねしたitem全てのitem.id
			x = [] #xを配列にする
			@likes.each do |like|
				x << like.item_id #xにlike.item_idを全て代入して配列にする
			end
			logger.debug(x)
			#like_recommend = item_recommendの中でそのユーザーがいいねしていないitem
			@like_recommend = item_recommend.where.not(id: x)
			#チャート
			gon.item = @like_recommend.last
			gon.taist = @like_recommend.last.taist
		else
			@like_recommend = Item.order("RANDOM()").last
			gon.item = @like_recommend
			gon.taist = @like_recommend.taist
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
		@user = User.find(params[:id])
    	@user.update(is_deleted: true)
    	reset_session
    	flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    	redirect_to root_path
	end

	def following
	    @user  = User.find(params[:id])
	    @users = @user.following
	    render 'show_follow'
	end

	def followers
	    @user  = User.find(params[:id])
	    @users = @user.followers
	    render 'show_follower'
	end

	def likes
	    @user = User.find_by(id: params[:id])
	    @likes = Like.where(user_id: @user.id)
  	end

  	def my_index
		@user = User.find(params[:id])
		@items = @user.items.page(params[:page]).reverse_order
	end

	private
	def user_params
	    params.require(:user).permit(:name, :email, :address, :profile_image)
	end
end
