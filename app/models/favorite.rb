class Favorite < ApplicationRecord
#未使用-----------------------------------------------------------------------
  belongs_to :user
  belongs_to :item

  scope :filter_by_item, ->(item_id) { where(item_id: item_id) if item_id }
end
