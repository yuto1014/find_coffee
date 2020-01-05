class CreateTaists < ActiveRecord::Migration[5.2]
  def change
    create_table :taists do |t|
      t.integer :fruity
      t.integer :refresh
      t.integer :body
      t.integer :bitter
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
