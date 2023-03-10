class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

def index
      @products = Product.all
end

def show
 
end

def new
  @product = Product.new
end

def edit
end

def create
  @product = Product.new(product_params)
  if @product.save
    redirect_to products_path,  notice: "Your Product  was successfully created."
  else
    redirect_to new
  end
end

def update
  if @product.update(product_params)
    redirect_to products_path, notice: "Your Product  was successfully updated."
  else
    render :edit
  end
end

def destroy
  @product.destroy
  redirect_to root_path, notice: "Your Product   was successfully destroyed."
end

private

# Use callbacks to share common setup or constraints between actions.
def set_product
  @product = Product.find(params[:id])
end

# Only allow a trusted parameter "white list" through.
def product_params
  params.require(:product).permit(:product_name,
                              :category_name,
                              :photo
                              )
end
end
