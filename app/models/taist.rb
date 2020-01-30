class Taist < ApplicationRecord
	#アソシエーション
	has_many :items
	#親子同時保存(親taist/子:item)
	accepts_nested_attributes_for :items, allow_destroy: true
	#バリデーション(コーヒーマップは4つのカラムを一つのラジオボタンでcreateするためバリデーションは1つにしてエラーメッセージも1つにする)
	validates :fruity, presence: true
	# validates :refresh, presence: true
	# validates :body, presence: true
	# validates :bitter, presence: true

end
