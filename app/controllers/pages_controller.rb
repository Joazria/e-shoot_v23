class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def profile 
    @user = current_user 
    @orders = Order.where(user_id: current_user)
    @client = Client.where(user_id: current_user).last
    @instudios = Instudio.where(user_id: current_user)
    @deliveries = Delivery.all
  end


  def dashboard
    @orders = Order.all
    @deliveries = Delivery.all
  end

  def dashboard_instudio
    @orders = Order.all
    @instudios = Instudio.all
  end
end
