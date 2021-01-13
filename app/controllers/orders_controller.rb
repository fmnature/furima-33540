class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_form = OrderForm.new(order_params)
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id || item.order.present?
      redirect_to root_path
    end
    if @order_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_form.save
      redirect_to root_path
    else
      @item = item
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_num, :area_id, :municipal, :address, :build_name, :phone_num, :order_id).merge(token: params[:token], buyer_id: current_user.id, item_id: params[:item_id])
  end
end
