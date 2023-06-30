class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item , only:[:show, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
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
  end

  def edit
    return unless current_user != @item.user
    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
  end
end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_detail, :category_id, :condition_id, :cost_id, :region_id, :howmanydays_id,
                                 :price, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
