class ItemsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_session, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :estimated_shipping_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def set_tweet
    @item = Item.find(params[:id])
  end

  def move_to_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
