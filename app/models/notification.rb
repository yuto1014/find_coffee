class Notification < ApplicationRecord
	default_scope->{order(created_at: :desc)}
  	belongs_to :item, optional: true
end
