class Purchase
  include ActiveModel::Model
  attr_accessor :zip_code, :area_id, :city, :street_number, :billding_name, :phone_number, :item_id, :user_id, :order_id, :token

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, area_id: area_id, city: city, street_number: street_number, billding_name: billding_name, phone_number: phone_number, order_id: order.id)
  end

  with_options presence: true do
    validates :token
    validates :zip_code,         format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :city             
    validates :street_number     
    validates :phone_number,      length: {maximum: 11}
  end
  validates :area_id,          numericality: { other_than: 0 }
end