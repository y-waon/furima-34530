class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find, only: [:show, :edit, :update, :destroy, :move_to_index]
  before_action :move_to_index, only: [:edit, :update, :destroy]
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
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :text, :price, :status_id, :category_id, :burden_id, :area_id, :guideline_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if @product.buy.present? || current_user.id != @product.user_id
      redirect_to action: :index
    end
  end

  def find
    @product = Product.find(params[:id])
  end
end
