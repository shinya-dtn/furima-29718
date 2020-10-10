class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :zip_code,           null: false
      t.integer    :area_id,            null: false
      t.string     :city,               null: false
      t.string     :street_number,      null: false
      t.string     :billding_name      
      t.string     :phone_number,       null: false
      t.integer    :order_id,           null: false, foregin_key: true
      t.timestamps
    end
  end
end
