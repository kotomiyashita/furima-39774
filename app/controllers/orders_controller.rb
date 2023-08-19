class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_shippinginfo = OrderShippinginfo.new
  end

  def create
    @order_shippinginfo = OrderShippinginfo.new(order_params)
    if @order_shippinginfo.valid?
      @order_shippinginfo.save
      return redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def order_params
    params.require(:order_shippinginfo).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end