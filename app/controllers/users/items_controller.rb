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
		#新着順
		@items = Item.order(created_at: :desc).limit(8)
		#いいね数が多い順
		@all_ranks = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(8).pluck(:item_id))
		if @items
		   @random = Item.order("RAND()").limit(8)
		end
		@taists = Taist.all
	end

	def index_add
		#paramsのナンバーの数字で新着順かいいね順かを判別
		if params[:sort] == "1"
			@items = Item.page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "2"
			@items = Item.find(Like.group(:item_id).order('count(item_id) desc').pluck(:item_id))
			#ページネーション
			@items = Kaminari.paginate_array(@items).page(params[:page]).per(20)
		end
	end

	def follow_index
		@item_all = Item.all
		@user = User.find(current_user.id)
		#@userのフォローしているユーザー
		@follow_users = @user.following
		#@follow_usersの投稿
		@items = @item_all.where(user_id: @follow_users).order(created_at: :desc)
		@items = Kaminari.paginate_array(@items).page(params[:page]).per(20)
	end

	def show
		@item = Item.find(params[:id])
		#railsの変数をchart.jsに渡す
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
		#コーヒーマップ(FIND)の各ブロックに紐づいた投稿を新着順で5つ
		@taistA = Taist.where(refresh:3, bitter:0, body:0, fruity:3).order(created_at: :desc).limit(5)
		@taistB = Taist.where(refresh:3, bitter:1, body:0, fruity:2).order(created_at: :desc).limit(5)
		@taistC = Taist.where(refresh:2, bitter:0, body:1, fruity:3).order(created_at: :desc).limit(5)
		@taistD = Taist.where(refresh:2, bitter:1, body:1, fruity:2).order(created_at: :desc).limit(5)
		@taistE = Taist.where(refresh:3, bitter:2, body:0, fruity:1).order(created_at: :desc).limit(5)
		@taistF = Taist.where(refresh:3, bitter:3, body:0, fruity:0).order(created_at: :desc).limit(5)
		@taistG = Taist.where(refresh:2, bitter:2, body:1, fruity:1).order(created_at: :desc).limit(5)
		@taistH = Taist.where(refresh:2, bitter:3, body:1, fruity:0).order(created_at: :desc).limit(5)
		@taistI = Taist.where(refresh:1, bitter:0, body:2, fruity:3).order(created_at: :desc).limit(5)
		@taistJ = Taist.where(refresh:1, bitter:1, body:2, fruity:2).order(created_at: :desc).limit(5)
		@taistK = Taist.where(refresh:0, bitter:0, body:3, fruity:3).order(created_at: :desc).limit(5)
		@taistL = Taist.where(refresh:0, bitter:1, body:3, fruity:2).order(created_at: :desc).limit(5)
		@taistM = Taist.where(refresh:1, bitter:2, body:2, fruity:1).order(created_at: :desc).limit(5)
		@taistN = Taist.where(refresh:1, bitter:3, body:2, fruity:0).order(created_at: :desc).limit(5)
		@taistO = Taist.where(refresh:0, bitter:2, body:3, fruity:1).order(created_at: :desc).limit(5)
		@taistP = Taist.where(refresh:0, bitter:3, body:3, fruity:0).order(created_at: :desc).limit(5)
	end

	def taist_research
		#コーヒーマップ(FIND)の各ブロックに応じたモーダル内"もっと見る"を押した時のparamsナンバーで判別
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
	#itemのタイトル(name)を曖昧検索
      	@items = Item.where('items.name LIKE(?)', "%#{params[:search]}%").page(params[:page]).per(20).order(created_at: :desc)
      	#フォームに入力した内容を取ってくる
      	@search_result = "#{params[:search]}"
    end

    def media_search
    	#レスポンシブ時の検索フォーム
    	@items = Item.order(created_at: :desc).limit(8)
    end


	private
  	def item_params
    	params.require(:item).permit(:name, :image, :opinion, :place, :tast_id, :user_id)
  	end

	def correct_user
		#ログインユーザーとparamsユーザーが同じでないとプロフィールの編集と更新はできない
		@item = Item.find(params[:id])
		if current_user != @item.user
			redirect_to root_path
		end
    end

end
