class ClientsController < ApplicationController
  before_action :set_client, only: [ :show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

  def index
        @clients = Client.all
  end

  def show
  
  end

  def new
    @client = Client.new
    
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    @order = Order.where(:user_id == current_user.id)

    if @client.save
      redirect_to profile_path, notice: "Your Client Account was successfully created."
    else
      render :new
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Your Client Account was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to root_path, notice: "Your Client Account was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_params
    params.require(:client).permit(:company,
                                  :phone,
                                  :whatsapp,
                                  :first_name,
                                  :last_name,
                                  :cnpj,
                                  :address,
                                  :longitude,
                                  :latitude
                                )
  end 
end
