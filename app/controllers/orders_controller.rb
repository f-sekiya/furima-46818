class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
  end

  def create
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.order.present? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
