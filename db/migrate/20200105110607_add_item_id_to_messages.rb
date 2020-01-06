class AddItemIdToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :item_id, :integer
  end
end
