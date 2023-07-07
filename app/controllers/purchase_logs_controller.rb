class PurchaseLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user == current_user || !@item.purchase_log.nil?
      redirect_to root_path
      return
    end
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @kaimono = Kaimono.new
  end

  def create
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @price = @item.price
    @kaimono = Kaimono.new(kaimono_params)
    if @kaimono.valid?

      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @price, # 商品の値段
        card: kaimono_params[:token], # カードトークン
        currency: 'jpy' # 商品の値段
      )

      @kaimono.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def kaimono_params
    params.require(:kaimono).permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone_number, :tokennd).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


end
