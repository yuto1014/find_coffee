class DirectMessage < ApplicationRecord
  #アソシエーション
  belongs_to :user
  belongs_to :room
  #ブロードキャスト
  after_create_commit { DirectMessageBroadcastJob.perform_later self }
end
