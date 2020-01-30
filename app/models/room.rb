class Room < ApplicationRecord
	#アソシエーション
	has_many :entries, dependent: :destroy
	has_many :direct_messages, dependent: :destroy
	has_many :users, through: :entries
end
