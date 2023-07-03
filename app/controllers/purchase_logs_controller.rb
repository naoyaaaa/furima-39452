class PurchaseLogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @kaimono = Kaimono.new
  end


  def create
    @item = Item.find(params[:item_id])
    @kaimono = Kaimono.new(kaimono_params)
    if @kaimono.valid?
      @kaimono.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


  private

  def kaimono_params
    params.require(:kaimono).permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id,  item_id: params[:item_id])
  end
  
  
end
