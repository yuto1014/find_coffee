class Api::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Favorite.filter_by_post(params[:item_id]).select(:id, :user_id, :item_id)
  end

  def create
    current_user.favorites.create!(favorites_params)
    head :created
  end

  def destroy
    current_user.favorites.find(params[:id]).destroy!
    head :ok
  end

  private

  def favorites_params
    params.require(:favorite).permit(:item_id)
  end

end
