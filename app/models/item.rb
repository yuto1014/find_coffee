class Item < ApplicationRecord

	belongs_to :taist
	belongs_to :user

	has_many :likes, dependent: :destroy
	has_many :liked_users, through: :likes, source: :user
	def liked_by?(user)
		likes.where(user_id: user.id).exists?
	end

	has_many :favorites, dependent: :destroy

	has_many :comments, dependent: :destroy

	attachment :image

	has_many :notifications,dependent: :destroy
	def create_notification_by(current_user)
    notification=current_user.active_notifications.new(
      item_id:self.id,
      visited_id:self.contributer.id,
      action:"like"
    )
    notification.save if notification.valid?
  end

end
