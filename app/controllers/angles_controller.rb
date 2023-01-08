class AnglesController < ApplicationController
  before_action :set_angle, only: [ :show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

  def index
      @order = Order.find(params[:order_id])
      @category = @order.category 
      @angles = Angle.where(:category_id == @order.category_id)

  end

  def show
    @category = @angle.category
  end

  def new
    @category = Category.find(params[:category_id])
    @angle = Angle.new
  end

  def edit
    @category = @background.category
  end

  def create
    @angle = Angle.new(angle_params)
    @category = Category.find(params[:category_id])
    @angle.category = @category
    
    if @angle.save
      redirect_to categories_path, notice: "Your Product Angle was successfully created."
    else
      render :new
    end
  end

  def update
    if @angle.update(angle_params)
      redirect_to @category, notice: "Your Product Angle was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @angle.destroy
    redirect_to root_path, notice: "Your Product Angle was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_angle
    @angle = Angle.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def angle_params
    params.require(:angle).permit(:angle_name,
                                :description,
                                :photo
                                )
  end
end
