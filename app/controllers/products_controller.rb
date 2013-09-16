class ProductsController < ApplicationController

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new(params[:id])
  end

  def create
    @product = Product.new(params.require(:product).permit(:title, :description, :price))
    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params.require(:product).permit(:title, :description, :price))
      redirect_to @product
    else 
      render :edit 
    end 
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end 

end
