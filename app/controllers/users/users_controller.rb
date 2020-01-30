class Users::UsersController < ApplicationController
	before_action :correct_user, only: [:edit, :update]
	before_action :authenticate_user!
	def show
		@user = User.find(params[:id])
		@items = @user.items.page(params[:page]).reverse_order
		@events = Event.where(user_id: @user.id)
		@event = Event.new
		#@userがいいねした投稿
		@likes = Like.where(user_id: @user.id).order(created_at: :desc)
		@like_items = @likes.take(8)
		# logger.debug(@likes)
		#ユーザーへのおすすめの投稿を取ってくる
		if @likes.exists?
			# logger.debug("likes")
			#like = そのユーザーのいいねid
			like = @likes.last
			# logger.debug(like)
			#item = likeのitem_idが含まれるitem.id
			item = like.item
			# logger.debug(item)
			#item_recommend = itemと同じtaist
			taist_recommend = Taist.find_by(refresh: item.taist.refresh, bitter: item.taist.bitter, body: item.taist.body, fruity: item.taist.fruity)
			# logger.debug(taist_recommend)
			#item_recommend = taist_recommendと同じアイテムを全て
			item_recommend = taist_recommend.items
			# logger.debug(item_recommend)
			#いいねしたitem全てのitem.id
			x = [] #xを配列にする
			@likes.each do |like|
				x << like.item_id #xにlike.item_idを全て代入して配列にする
			end
			logger.debug(x)
			#like_recommend = item_recommendの中でそのユーザーがいいねしていないitem
			@like_recommend = item_recommend.where.not(id: x).last
			#チャート
			unless @like_recommend.nil?
				#chart.jsにrailsの変数を渡す
				gon.item = @like_recommend
				gon.taist = @like_recommend.taist
			else
				@like_recommend = Item.order("RANDOM()").last
				gon.item = @like_recommend
				gon.taist = @like_recommend.taist
			end
		else
			#@userがいいねした投稿が無ければランダムで投稿を表示する
			@like_recommend = Item.order("RANDOM()").last
			gon.item = @like_recommend
			gon.taist = @like_recommend.taist
		end
		#チャット
		if user_signed_in?
			#Entry内のuser_idがcurrent_userと同じEntry
			@currentUserEntry = Entry.where(user_id: current_user.id)
			#Entry内のuser_idがMYPAGEのparams.idと同じEntry
		    @userEntry = Entry.where(user_id: @user.id)
		    	#@user.idとcurrent_user.idが同じでなければ
			    unless @user.id == current_user.id
			      @currentUserEntry.each do |cu|
			        @userEntry.each do |u|
			          #もしcurrent_user側のルームidと＠user側のルームidが同じであれば存在するルームに飛ぶ
			          if cu.room_id == u.room_id then
			            @isRoom = true
			            @roomId = cu.room_id
			          end
			        end
			      end
			      #ルームが存在していなければルームとエントリーを作成する
			      unless @isRoom
			        @room = Room.new
			        @entry = Entry.new
			      end
			    end
	  	end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    	# respond_to do |format|
	      if @user.update(user_params)
	      	render :update
	        # format.html { redirect_to @user, notice: 'User was successfully created.' }
	        # format.json { render :show, status: :ok, location: @user }
	        # format.js { @status = "success"}
	      else
	      	render :update_error
	        # format.html { render :show }
	        # format.json { render json: @user.errors, status: :unprocessable_entity }
	        # format.js { @status = "fail" }
	      end
	end

	def hide
		#ユーザーの退会(論理削除)
		@user = User.find(params[:id])
		#is_deletedカラムにフラグを立てる(defaultはfalse)
    	@user.update(is_deleted: true)
    	#ログアウトさせる
    	reset_session
    	flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    	redirect_to root_path
	end

	def following
		#@userがフォローしているユーザー
	    @user  = User.find(params[:id])
	    @users = @user.following
	    render 'show_follow'
	end

	def followers
		#@userをフォローしているユーザー
	    @user  = User.find(params[:id])
	    @users = @user.followers
	    render 'show_follower'
	end

	def likes
		#@userがいいねしている投稿一覧
	    @user = User.find_by(id: params[:id])
	    @likes = Like.where(user_id: @user.id)
  	end

  	def my_index
  		#@userの投稿一覧
		@user = User.find(params[:id])
		@items = @user.items.page(params[:page]).reverse_order
	end


	private

	def correct_user
		#@userとcurrent_userが同じで無ければプロフィールの編集更新はできない
		@user = User.find(params[:id])
		if current_user != @user
			redirect_to root_path
		end
    end

	def user_params
	    params.require(:user).permit(:name, :email, :address, :profile_image)
	end

end
