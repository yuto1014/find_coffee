class Taist < ApplicationRecord
	has_many :items
	accepts_nested_attributes_for :items, allow_destroy: true

end
