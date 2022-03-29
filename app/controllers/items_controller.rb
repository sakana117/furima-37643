class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
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
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:item_name,:item_info,
                                 :category_id,:sales_status_id,:shipping_fee_status_id,:prefecture_id,
                                 :scheduled_delivery_id,:item_price,:image)
                                 .merge(user_id: current_user.id)
  end
end
