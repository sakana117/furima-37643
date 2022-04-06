class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index]

  def index
    @item = Item.find(params[:item_id])
    if Order.where(item_id: @item.id).exists? || current_user.id == @item.user_id
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)    
    if @order_address.valid?
      Payjp.api_key = "sk_test_*"
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).item_price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id,
                                          :city, :addresses, :building, :phone_number, :order_id)
                                          .merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end
end
