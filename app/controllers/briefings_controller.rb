class BriefingsController < ApplicationController
  before_action :set_briefing, only: [ :show, :edit, :update, :destroy]

  def index

  end
  
  def show
   
  end
  
  def new
    @order = Order.find(params[:order_id])
    @briefing = Briefing.new
     
  end
  
  def edit
  end

  def create
    @briefing = Briefing.new(briefing_params)
    @order = Order.find(params[:order_id])
    @briefing.order = @order

    if @briefing.save
      if current_user.client.nil? 
        redirect_to new_client_path
      else 
      redirect_to order_checkout_path(@order), notice: "Your Briefing was successfully created."
      end
    else
      render :new
    end
  end
  
  def update
    if @briefing.update(briefing_params)
      redirect_to profile_path, notice: "Your Briefing was successfully updated."
    else
      render :edit
    end
  end
  
  def destroy
    @briefing.destroy
    redirect_to root_path, notice: "Your Briefing  was successfully destroyed."
  end
  
  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_briefing
    @briefing = Briefing.find(params[:id])
  end
  
  # Only allow a trusted parameter "white list" through.
  def briefing_params
    params.require(:briefing).permit(:release,
                                :ref1,
                                :ref2,
                                :upload1,
                                :upload2,
                                :order_id
                                )
  end
  
  
end
