class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index]

  def index
    @items = Item.all
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    
  end

  #def show
  #end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new 
    end
  end

  #def destroy
  #end

  
  private
    def item_params
      params.require(:item).permit(:image, :name, :price, :info, :category_id,:sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
    end


end
