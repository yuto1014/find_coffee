class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :title
      t.string :body
      t.text :reply
      t.integer :customer_id

      t.timestamps
    end
  end
end
