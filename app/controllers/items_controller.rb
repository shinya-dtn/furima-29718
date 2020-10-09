class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
  end

  # def delete
  # end

  # def update
  #   item = Item.find(params[:id])
  #   item.update(item_params)
  # end

  private

  def item_params
    params.require(:item).permit(:image, :prodact_name, :comment, :category_id, :status_id, :burden_id, :area_id, :day_id, :money).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
