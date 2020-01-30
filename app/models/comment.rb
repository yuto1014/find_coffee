class Comment < ApplicationRecord
	#アソシエーション
	belongs_to :user
	belongs_to :item
	#バリデーション
	validates :content, presence: true
end
