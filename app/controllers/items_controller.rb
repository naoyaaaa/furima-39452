class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  def show
    @item = Item.find(params[:id])

  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_detail, :category_id, :condition_id, :cost_id, :region_id, :howmanydays_id, :price, :image)
  end
  
  
end
