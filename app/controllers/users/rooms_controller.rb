class Users::RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @currentEntries = current_user.entries
    myRoomIds = []
    @currentEntries.each do |entry|
      myRoomIds << entry.room.id
    end
    @anotherEntries = Entry.where(room_id: myRoomIds).where.not(user_id: @user.id)
  end

  def show
    @room = Room.find(params[:id])
    #present?の戻り値は真偽値。よって、trueの場合、
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @direct_messages = @room.direct_messages
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    @room = Room.create(:name => "DM")
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to users_room_path(@room.id)
  end
end
