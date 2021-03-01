class BuysController < ApplicationController
  before_action :authenticate_user!
  def index
    @buy =  DonationAddress.new
    @product = Product.find(params[:product_id])
  end
  def create
    @product = Product.find(params[:product_id])
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
end
