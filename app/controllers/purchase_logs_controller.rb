class PurchaseLogsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @kaimono = Kaimono.new
  end

  def create
    @kaimono = Kaimono.new(kaimono_params)
    if @kaimono.valid?
      @kaimono.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def kaimono_params
    params.require(:kaimono).permit(:postal_code, :region_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
