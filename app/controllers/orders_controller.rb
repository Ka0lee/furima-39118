class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order = Order.new
  end

  def new
    @order_pay_form = OrderPayForm.new
  end

  def create
    @order_pay_form = OrderPayForm.new(orderpayform_params)
    if @order_pay_form.valid?
      @order_pay_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def orderpayform_params
    params.require(:order_pay_form).permit(:postal_code, :prefecture, :city, :address, :phone_number, :building).merge(user_id: current_user.id)
  end

end
