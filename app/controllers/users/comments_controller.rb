class Users::CommentsController < ApplicationController
	def create
    @item = Item.find(params[:item_id]) #①
    @comment = @item.comments.build(comment_params) #②
    @comment.user_id = current_user.id #③
    if @comment.save
      render :index #④
    end
  end

 def destroy
    @comment = Comment.find(params[:id]) #⑤
    if @comment.destroy
      render :index #⑥
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :item_id, :user_id)
    end
end
