class Event < ApplicationRecord
	#アソシエーション
	belongs_to :user
	# # 前月のイベント削除
	#   def self.event_destroy
	#     events = Event.where("created_at between '#{Time.zone.now.ago(1.month)}' and '#{Time.zone.now.ago(1.days)}'")
	#     events.delete_all
	#   end
end
