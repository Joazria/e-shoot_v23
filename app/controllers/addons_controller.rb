class AddonsController < ApplicationController
  before_action :set_addon, only: [ :show, :edit, :update, :destroy]

  def index
        @addons = Addon.all
         @instudio = Instudio.find(params[:instudio_id])
  end

  def show
  
  end

  def new
    @product = Product.find(params[:product_id])
    @addon = Addon.new
  end

  def edit
  end

  def create
    @addon = Addon.new(addon_params)
    @addon.product = Product.find(params[:product_id])

    if @addon.save
      redirect_to products_path, notice: "Your Product Add-on was successfully created."
    else
      render :new
    end
  end

  def update
    if @addon.update(addon_params)
      redirect_to products_path, notice: "Your Product Add-on was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @addon.destroy
    redirect_to root_path, notice: "Your Product Add-on  was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_addon
    @addon = Addon.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def addon_params
    params.require(:addon).permit(:addon_name,
                                :photo,
                                :product_id
                                )
  end
end
