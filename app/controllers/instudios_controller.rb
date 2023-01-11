class InstudiosController < ApplicationController
  before_action :set_instudio, only: [ :show, :edit, :destroy, :background]

  def index
        @instudios = Instudio.all
  end

  def show   
  end   


  def addons
    @instudio = Instudio.find(params[:instudio_id])
    #  @category = Category.find(params[:category_id])
    @addons = Addon.all
  end

  def new
    @instudio = Instudio.new
  end

  def edit

  end

  def create
    @instudio = Instudio.new(instudio_params)
    @instudio.user = current_user 
    @product = @instudio.product 

    if @instudio.save
      redirect_to instudio_moodboards_path(@instudio), notice: "Your Order was successfully created."
    else  
      render :new
    end
  end


  def checkout
    @instudio = Instudio.find(params[:instudio_id])
    # @moodboards = Angle.where(:category_id == @category)
    # @briefing = Briefing.where(order_id: @order.id).last
    # @client = Client.where(user_id: current_user.id)
  end



  def update
    @instudio = Instudio.find(params[:id])
  
    if params[:addon_id].present?
      @instudio.update(instudio_params)
      redirect_to new_instudio_calendar_path(@instudio)
      
    elsif params[:moodboard_id].present?
      @instudio.update(instudio_params)
      redirect_to instudio_addons_path(@instudio)

    elsif params[:step].present?
      @instudio.update(instudio_params)
      redirect_to dashboard_path

    else
      render :new
        
      end
  end


  def destroy
    @instudio.destroy
    redirect_to root_path, notice: "Your Order was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_instudio
    @instudio = Instudio.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def instudio_params
    params.permit(:product_id, 
                                  :moodboard_id,
                                  :step,
                                  :addon_id,
                                  :calendar_id,
                                  :client_id )
  end


end
