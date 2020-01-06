class Item < ApplicationRecord

	belongs_to :taist

	has_many :likes, dependent: :destroy
	has_many :liked_customers, through: :likes, source: :user
	def liked_by?(customer)
		likes.where(user_id: user.id).exists?
	end

	has_many :comments, dependent: :destroy

	attachment :image
end
