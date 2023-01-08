class MoodboardsController < ApplicationController
  before_action :set_moodboard, only: [ :show, :edit, :update, :destroy]

  def index
        @moodboards = Moodboard.all
        @instudio = Instudio.find(params[:instudio_id])
  end

  def show
  
  end

  def new
    @product = Product.find(params[:product_id])
    @moodboard = Moodboard.new
  end

  def edit
  end

  def create
    @moodboard = Moodboard.new(moodboard_params)
    @moodboard.product = Product.find(params[:product_id])

    if @moodboard.save
      redirect_to products_path, notice: "Your Product Moodboard was successfully created."
    else
      render :new
    end
  end

  def update
    if @moodboard.update(mooodboard_params)
      redirect_to products_path, notice: "Your Product Moodboard was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @moodboard.destroy
    redirect_to root_path, notice: "Your Product Moodboard  was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_moodboard
    @moodboard = Moodboard.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def moodboard_params
    params.require(:moodboard).permit(:moodboard_name,
                                :photo,
                                :product_id
                                )
  end
end
