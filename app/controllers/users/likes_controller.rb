class Users::LikesController < ApplicationController
	before_action :item_params
  def create
      like = current_user.likes.new(item_id: @item.id)
      like.save
      @item = Item.find(params[:item_id])
      @item.create_notification_by(current_user)
      respond_to do |format|
        format.html {redirect_to request.referrer}
        format.js
      end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, item_id: @item.id).destroy
  end

  private

  def item_params
    @item = Item.find(params[:item_id])
  end
end
