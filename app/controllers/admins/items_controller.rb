class Admins::ItemsController < ApplicationController
	def index
		@items = Item.all.order(created_at: :desc).limit(4)
		@all_ranks = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(8).pluck(:item_id))
		@random = Item.order("RANDOM()").limit(8)
		@taists = Taist.all
	end

	def show
	end

	def edit
	end

	def update
	end

	def new
	end

	def create
	end

	def hide
	end

	def like
	end
end
