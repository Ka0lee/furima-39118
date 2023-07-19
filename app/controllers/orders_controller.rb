class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only:[:index, :create]

  def index
    @order = Order.new
    @order_pay_form = OrderPayForm.new
    if current_user == @item.user || @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @order_pay_form = OrderPayForm.new(orderpayform_params)
    if @order_pay_form.valid?
      pay_item
      @order_pay_form.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def orderpayform_params
    params.require(:order_pay_form).permit(:postal_code, :prefecture, :city, :address, :phone_number, :building).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: orderpayform_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id]) 
  end

  
end
