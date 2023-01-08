class DeliveriesController < ApplicationController
  before_action :set_delivery, only: [ :show, :edit, :update, :destroy]

  def index

  end
  
  def show
   
  end
  
  def new
    @order = Order.find(params[:order_id])
    @delivery = Delivery.new
    
  end
  
  def edit
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @order = Order.find(params[:order_id])
    @delivery.order = @order

    if @delivery.save
      redirect_to dashboard_path, notice: "Start Your Delivery"
    else
      render :new
    end
  end
  
  def update
    if @delivery.update(delivery_params)
      redirect_to dashboard_path, notice: "Your Delivery was successfully updated."
    else
      render :edit
    end
  end
  
  def destroy
    @delivery.destroy
    redirect_to root_path, notice: "Your Delivery  was successfully destroyed."
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_delivery
    @delivery = Delivery.find(params[:id])
  end
  
  # Only allow a trusted parameter "white list" through.
  def delivery_params
    params.require(:delivery).permit(:delivery_date,
                                :delivery_link,
                                :step,
                                :order_id
                                )
  end
  
  
end
