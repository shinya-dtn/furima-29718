class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_order, only: [:index]
  # def index
  # end
  

  def create
    @order = Purchase.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def move_to_order
    if user_signed_in? == false
      redirect_to root_path
      return
    end

    if @item.order || current_user.id == @item.user_id
      redirect_to root_path
    end

  end


  def order_params
    params.permit(:zip_code, :area_id, :city, :street_number, :billding_name, :phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.money,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
