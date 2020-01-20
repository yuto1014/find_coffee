module Users::NotificationsHelper

	def notification_form(notification)
	  @visiter = notification.visiter
	  @comment = nil
	  visiter = link_to notification.visiter.name, users_user_path(@visiter), style:"font-weight: bold;"
	  your_item = link_to 'あなたの投稿', users_item_path(notification), style:"font-weight: bold;"
	  case notification.action
	    when "follow" then
	      tag.a(notification.visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"があなたをフォローしました"
	    when "like" then
	      tag.a(notification.visiter.name, href:users_user_path(@visiter), style:"font-weight: bold;")+"が"+tag.a('あなたの投稿', href:users_item_path(notification), style:"font-weight: bold;")+"にいいねしました"
	    when "comment" then
	      @comment = Comment.find_by(id:@visiter.comment_id)&.content
	      "#{visiter}が#{your_item}にコメントしました"
	  end
	end
end
