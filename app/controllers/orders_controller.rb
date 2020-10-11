class OrdersController < ApplicationController
  before_action :move_to_index, expect: [:index]
  def index
    @item = Item.find(params[:item_id])
  end
  private
  def move_to_index
    redirect_to root_path unless user_signed_in?
  end
end
