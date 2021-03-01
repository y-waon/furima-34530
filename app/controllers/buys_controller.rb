class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :find, only: [:index, :create, :move_to_index]
  before_action :move_to_index, only: [:index,:create]
  def index
    @buy =  DonationAddress.new
  end
  def create
    @buy = DonationAddress.new(address_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def address_params
    params.require(:donation_address).permit(:post_number, :area_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price, 
        card: address_params[:token], 
        currency: 'jpy'
      )
  end
  def move_to_index
    if @product.buy.present? || current_user.id == @product.user_id
      redirect_to root_path
    end
  end
  def find
    @product = Product.find(params[:product_id])
  end
end
