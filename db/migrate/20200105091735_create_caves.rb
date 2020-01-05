class CreateCaves < ActiveRecord::Migration[5.2]
  def change
    create_table :caves do |t|
      t.string :name
      t.string :opinion
      t.string :place
      t.string :roast
      t.string :food
      t.integer :category_id
      t.integer :taist_id
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
