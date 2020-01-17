class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :title
      t.boolean :disp_flg
      t.datetime :start
      t.datetime :end
      t.string :allDay

      t.timestamps
    end
  end
end
