class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_user, only: [:index, :create]

  def index
    gon_public
    @order_shippinginfo = OrderShippinginfo.new
  end

  def create
    @order_shippinginfo = OrderShippinginfo.new(order_params)
    if @order_shippinginfo.valid?
      pay_item
      @order_shippinginfo.save
      return redirect_to root_path
    else
      gon_public
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shippinginfo).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_user
    if current_user.id == @item.user.id || @item.order.present?
      redirect_to root_path
    end
  end

  def gon_public
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end

end