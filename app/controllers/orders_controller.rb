class OrdersController < ApplicationController
  def index
    #@order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  #def new
    #@order_address = OrderAddress.new
  #end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id,
                                          :city, :addresses, :building, :phone_number, :order_id)
                                          .merge(user_id: current_user.id,item_id: params[:item_id])
  end
end