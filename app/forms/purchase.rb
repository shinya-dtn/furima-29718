class Purchase
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :city, :street_number, :billding_name, :phone_number, :item_id, :user_id, :order_id, :token

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, area_id: area_id, city: city, street_number: street_number, billding_name: billding_name, phone_number: phone_number, order_id: order.id)
  end
end
