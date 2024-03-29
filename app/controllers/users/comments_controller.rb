class Users::CommentsController < ApplicationController
	def create
    @item = Item.find(params[:item_id])
    #投稿に紐づいたコメントを作成
    @comment = @item.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment_item = @comment.item
    if @comment.save
      #通知の作成
      @comment_item.create_notification_comment!(current_user, @comment.id)
      render :index
    end
  end

 def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
       render :index
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :item_id, :user_id)
    end
end
