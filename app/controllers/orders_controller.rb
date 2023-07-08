class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    PayForm.create(pay_form_params)

    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price)
  end

  def pay_form_params
    params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(order_id: @order.id)
  end

end
