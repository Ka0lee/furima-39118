class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index,:show]
  before_action :set_item,only:[:show, :edit, :update]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    else
      render :new 
    end
  end

  def edit
      redirect_to root_path unless @item.user == current_user
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  #def destroy
  #end

  
  private
    def item_params
      params.require(:item).permit(:image, :name, :price, :info, :category_id,:sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
    end

    
    def set_item
      @item = Item.find(params[:id]) 
    end


end
