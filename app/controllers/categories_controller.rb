class CategoriesController < ApplicationController
  before_action :set_category, only: [ :show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

def index
      @categories = Category.all
end

def show
 
end

def new
  @category = Category.new
end

def edit
end

def create
  @category = Category.new(category_params)
  if @category.save
    redirect_to @category, notice: "Your Product Category was successfully created."
  else
    redirect_to new
  end
end

def update
  if @category.update(category_params)
    redirect_to @category, notice: "Your Product Category was successfully updated."
  else
    render :edit
  end
end

def destroy
  @category.destroy
  redirect_to root_path, notice: "Your Product Category  was successfully destroyed."
end

private

# Use callbacks to share common setup or constraints between actions.
def set_category
  @category = Category.find(params[:id])
end

# Only allow a trusted parameter "white list" through.
def category_params
  params.require(:category).permit(:category_name,
                              :description,
                              :photo
                              )
end
end
