class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :prodact_name, null: false
      t.text    :comment,     null: false
      t.integer :category_id, null: false
      t.integer :status_id,   null: false
      t.integer :burden_id,   null: false
      t.integer :area_id,     null: false
      t.integer :day_id,      null: false
      t.integer :money,       null: false
      t.integer :user_id,     null: false, foregin_key: true
      t.timestamps
    end
  end
end
