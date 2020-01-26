class Taist < ApplicationRecord
	has_many :items
	accepts_nested_attributes_for :items, allow_destroy: true

	validates :fruity, presence: true
	# validates :refresh, presence: true
	# validates :body, presence: true
	# validates :bitter, presence: true

end
