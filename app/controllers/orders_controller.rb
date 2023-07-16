class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item,only:[:index, :create]
  before_action :contributor_confirmation,only:[:index]


  def index
    @order = Order.new
    @order_pay_form = OrderPayForm.new
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
    params.require(:order_pay_form).permit(:postal_code, :prefecture, :city, :address, :phone_number, :building).merge(item_id: @item.id, user_id: @item.user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_795f3825a176519ed6975d2b"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: orderpayform_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id]) 
  end

  def contributor_confirmation
    redirect_to root_path unless @item.user == current_user
  end

end
