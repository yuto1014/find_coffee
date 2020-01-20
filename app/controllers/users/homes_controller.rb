class Users::HomesController < ApplicationController
  def top
  	@items = Item.all.order(created_at: :desc).limit(6)
  end

  def privacy_policy
  end

  def term
  end
end
