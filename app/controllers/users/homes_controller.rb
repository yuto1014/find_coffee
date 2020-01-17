class Users::HomesController < ApplicationController
  def top
  	@items = Item.all.order(created_at: :desc).limit(6)
  end

  def thanks
  end

  def unsubscribe
  end
end
