class Admins::ItemsController < ApplicationController
	def index
		#新着順
		@items = Item.all.order(created_at: :desc).limit(8)
		#いいね数が多い順
		@all_ranks = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(8).pluck(:item_id))
		@taists = Taist.all
	end

	def index_add
		#paramsの数字で新着順かいいね順かを判別する
		if params[:sort] == "1"
			@items = Item.all.page(params[:page]).per(20).order(created_at: :desc)
		elsif params[:sort] == "2"
			@items = Item.find(Like.group(:item_id).order('count(item_id) desc').pluck(:item_id))
			#ページネーション
			@items = Kaminari.paginate_array(@items).page(params[:page]).per(20)
		end
	end

	def show
		@item = Item.find(params[:id])
		#javascript(chart.js)にrailsの変数を渡す
		gon.item_show = @item
		gon.taist_show = @item.taist
		@comment = Comment.new
    	@comments = @item.comments.order(created_at: :desc)
    	@taist_show = Taist.find_by(refresh: @item.taist.refresh, bitter: @item.taist.bitter, body: @item.taist.body, fruity: @item.taist.fruity)
	end

	def show_like
		@item = Item.find(params[:id])
	end

	def destroy
		item = Item.find(params[:id])
    	item.destroy
    	redirect_to root_path
	end
end
