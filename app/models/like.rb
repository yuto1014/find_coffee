class Like < ApplicationRecord
	#アソシエーション
	belongs_to :item
	belongs_to :user
	#一意性
	validates_uniqueness_of :item_id, scope: :user_id
end
