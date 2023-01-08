class OrdersController < ApplicationController
  before_action :set_order, only: [ :show, :edit, :destroy, :background]

def index
      @orders = Order.all
end

def show
   @client = Client.where(user_id: @order.user_id) 
end   

def angles
  @order = Order.find(params[:order_id])
  @category = @order.category 
  @angles = Angle.where(:category_id == @order.category_id)
end

def backgrounds
  @order = Order.find(params[:order_id])
  #  @category = Category.find(params[:category_id])
  @backgrounds = Background.all
end

def new
  @order = Order.new
end

def edit
  @client = Client.where(user_id: @order.user_id) 

end

def create
  @order = Order.new(order_params_create)
  @order.user = current_user 
  @category = @order.category 

  if @order.save
    redirect_to order_angles_path(@order), notice: "Your Order was successfully created."
  else  
    render :new
  end
end

def briefing
    @order = Order.find(params[:order_id])
    @angles = Angle.where(:category_id == @category)
end

def checkout
  @order = Order.find(params[:order_id])
  @angles = Angle.where(:category_id == @category)
  @briefing = Briefing.where(order_id: @order.id).last
  @client = Client.where(user_id: current_user.id)

end


def sizes
  @order = Order.find(params[:order_id])
  @category = @order.category 
  @sizes = Size.where(:category_id == @order.category_id)
end



def delivery
  @order = Order.find(params[:order_id])
  # @category = @order.category 

  if  @order.update(order_params)
    redirect_to dashboard_path
  end  
end

def update
  @order = Order.find(params[:id])
  @category = @order.category 
 
  if params[:step].present?
    @order.update(order_params_create)
    redirect_to dashboard_path
    
  elsif @order.update(order_params_create)
    
    if  params[:briefing].present?
  
 
      redirect_to order_checkout_path(@order)
      
      

    elsif params[:size_id].present?
      redirect_to new_order_briefing_path(@order)
      
    elsif params[:background_id].present?
  
 
      redirect_to order_sizes_path(@order)


    elsif params[:angle_id].present?
      redirect_to order_backgrounds_path(@order)

     

    end 
    
      else 
        redirect_to root_path

      
    end
end


def destroy
  @order.destroy
  redirect_to root_path, notice: "Your Order was successfully destroyed."
end

private
# Use callbacks to share common setup or constraints between actions.
def set_order
  @order = Order.find(params[:id])
end

# Only allow a trusted parameter "white list" through.
def order_params
  params.require(:order).permit(:amounts, 
                :release, 
                :ref1,
                :ref2,
                :step,
                :upload,
                :category_id,
                :angle_id,
                :size_id,
                :bg,
                :sz,
                :ags,
                :bg_color,
                :delivery_date,
                :delivery_url,
                :background_id

                )
end

def order_params_create
  params.permit(:amounts,
                :release, 
                :ref1,
                :ref2,
                :step,
                :upload,
                :category_id,
                :angle_id,
                :size_id,
                :bg,
                :sz,
                :ags,
                :bg_color,
                :delivery_date,
                :delivery_url,
                :background_id

                )
end
end
