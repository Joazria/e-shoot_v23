class BackgroundsController < ApplicationController
  before_action :set_background, only: [ :show, :edit, :update, :destroy]

  def index
     @order = Order.find(params[:order_id])
    #  @category = Category.find(params[:category_id])
    @backgrounds = Background.all
  end

  def show
    @category = @background.category
  end

  def new
   
    @category = Category.find(params[:category_id])
    @background = Background.new
  end

  def edit
    # @category = Category.find(@background.category_id)
  end

  def create
    @background = Background.new(background_params)

    @background.category = Category.find(params[:category_id])


    
    if @background.save
      redirect_to categories_path, notice: "Your Background Product was successfully created."
    else
      render :new
    end
  end

  def update
   
    if @background.update(background_params)
      redirect_to category_path(@category), notice: "Your Background Product was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @background.destroy
    redirect_to root_path, notice: "Your Background Product was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_background
    @background = Background.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def background_params
    params.require(:background).permit(:bg_name,
                                :description,
                                :bg_color,
                                :photo
                                )
  end
end
