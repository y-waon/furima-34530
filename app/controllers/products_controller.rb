class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @products = Product.all.order(id: "DESC")
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @product = Product.find(params[:id])
  end
  private

  def product_params
    params.require(:product).permit(:title, :text, :price, :status_id, :category_id, :burden_id, :area_id, :guideline_id, :image).merge(user_id: current_user.id)
  end
end
