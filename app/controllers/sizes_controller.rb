class SizesController < ApplicationController
  before_action :set_size, only: [ :show, :edit, :update, :destroy]

def index
      @sizes = Size.all
      @order = Order.find(params[:order_id])
end

def show
 
end

def new
  @category = Category.find(params[:category_id])
  @size = Size.new
end

def edit
end

def create
  @size = Size.new(size_params)
  @size.category = Category.find(params[:category_id])

  if @size.save
    redirect_to categories_path, notice: "Your Product SIZE was successfully created."
  else
    render :new
  end
end

def update
  if @size.update(size_params)
    redirect_to @size, notice: "Your Product SIZE was successfully updated."
  else
    render :edit
  end
end

def destroy
  @size.destroy
  redirect_to root_path, notice: "Your Product SIZE  was successfully destroyed."
end

private

# Use callbacks to share common setup or constraints between actions.
def set_size
  @size = Size.find(params[:id])
end

# Only allow a trusted parameter "white list" through.
def size_params
  params.require(:size).permit(:size_name,
                              :description,
                              :photo
                              )
end


end
