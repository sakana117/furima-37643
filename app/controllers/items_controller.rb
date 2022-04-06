class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :set_item, only: [:show, :edit, :update,:destroy]

  def index
    @items=Item.all.order(created_at: :desc)
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if Order.where(item_id: @item.id).exists? || current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end    
  end

  def destroy
    if current_user.id == @item.user_id
      item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name,:item_info,
                                 :category_id,:sales_status_id,:shipping_fee_status_id,:prefecture_id,
                                 :scheduled_delivery_id,:item_price,:image)
                                 .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
