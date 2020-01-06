class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :opinion
      t.string :place
      t.string :roast
      t.string :food
      t.integer :taist_id
      t.boolean :is_deleted
      t.string :image_id

      t.timestamps
    end
  end
end
